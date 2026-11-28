#!/usr/bin/env python3
"""Fetch an itch.io game page and its free downloads.
usage: fetch.py <game url> <out dir>
Writes page.html, info.json and files/<name> for every upload it can get."""
import json, os, re, sys, urllib.request, urllib.parse, http.cookiejar, html

url, out = sys.argv[1].rstrip('/'), sys.argv[2]
os.makedirs(out + '/files', exist_ok=True)
cj = http.cookiejar.CookieJar()
op = urllib.request.build_opener(urllib.request.HTTPCookieProcessor(cj))
op.addheaders = [('User-Agent', 'Mozilla/5.0 (X11; Linux x86_64) Firefox/128.0')]

def get(u, data=None, hdr=None):
    req = urllib.request.Request(u, data=urllib.parse.urlencode(data).encode() if data is not None else None)
    for k, v in (hdr or {}).items(): req.add_header(k, v)
    with op.open(req, timeout=120) as r: return r.read()

page = get(url).decode('utf-8', 'replace')
open(out + '/page.html', 'w').write(page)
info = {'url': url}
m = re.search(r'name="csrf_token" value="([^"]+)"', page); csrf = m and m.group(1)
info['title'] = html.unescape((re.search(r'<title>(.*?)</title>', page, re.S) or [None, ''])[1]).strip()
# info table (Status, Platforms, Made with, ...)
rows = re.findall(r'<tr><td>(.*?)</td><td>(.*?)</td></tr>', page, re.S)
info['table'] = {re.sub('<[^>]+>', '', a).strip(): re.sub('<[^>]+>', ' ', b).strip() for a, b in rows}
info['price'] = re.findall(r'class="(?:price_value|buy_message)"[^>]*>(.*?)<', page)[:3]
info['iframe'] = re.findall(r'(https?://[^"\' ]*(?:itch\.zone|hwcdn\.net)[^"\' ]*index\.html)', html.unescape(page))[:3]
ups = re.findall(r'data-upload_id="(\d+)"[^>]*class="button download_btn".*?<strong[^>]*?title="([^"]*)"', page, re.S)
info['uploads_on_page'] = [{'id': i, 'name': html.unescape(n)} for i, n in ups]
sizes = re.findall(r'class="file_size"><span>([^<]*)<', page); info['sizes'] = sizes
info['downloads'] = []

def save(name, link):
    fn = out + '/files/' + re.sub(r'[^A-Za-z0-9._-]', '_', name)
    with op.open(urllib.request.Request(link), timeout=1800) as r, open(fn, 'wb') as f:
        while True:
            b = r.read(1 << 20)
            if not b: break
            f.write(b)
    info['downloads'].append({'name': name, 'bytes': os.path.getsize(fn), 'path': fn})

ok = False
# 1) direct free download buttons
for u in info['uploads_on_page']:
    try:
        j = json.loads(get(f"{url}/file/{u['id']}?source=view_game&as_props=1&after_download_lightbox=true", {'csrf_token': csrf}, {'X-Requested-With': 'XMLHttpRequest'}))
        if j.get('url'): save(u['name'], j['url']); ok = True
        else: info.setdefault('errors', []).append(['direct', u['id'], j])
    except Exception as e: info.setdefault('errors', []).append(['direct', u['id'], repr(e)])
# 2) name-your-price: "No thanks, just take me to the downloads"
if not ok:
    try:
        j = json.loads(get(url + '/download_url', {'csrf_token': csrf}, {'X-Requested-With': 'XMLHttpRequest'}))
        info['download_page'] = j.get('url')
        if j.get('url'):
            dp = get(j['url']).decode('utf-8', 'replace'); open(out + '/download.html', 'w').write(dp)
            key = j['url'].rstrip('/').split('/')[-1]
            m2 = re.search(r'name="csrf_token" value="([^"]+)"', dp); c2 = (m2 and m2.group(1)) or csrf
            ups2 = re.findall(r'data-upload_id="(\d+)"[^>]*class="button download_btn".*?<strong[^>]*?title="([^"]*)"', dp, re.S)
            info['uploads_on_download_page'] = [{'id': i, 'name': html.unescape(n)} for i, n in ups2]
            for i, n in ups2:
                try:
                    j2 = json.loads(get(f"{url}/file/{i}?source=game_download&key={key}", {'csrf_token': c2}, {'X-Requested-With': 'XMLHttpRequest'}))
                    if j2.get('url'): save(html.unescape(n), j2['url'])
                    else: info.setdefault('errors', []).append(['key', i, j2])
                except Exception as e: info.setdefault('errors', []).append(['key', i, repr(e)])
    except Exception as e: info.setdefault('errors', []).append(['download_url', repr(e)])
# 3) browser (HTML5) build: mirror index.html and every file it names
for fr in info['iframe'][:1]:
    base = fr.rsplit('/', 1)[0] + '/'; d = out + '/web'; os.makedirs(d, exist_ok=True)
    seen, todo, got = set(), ['index.html'], []
    while todo:
        rel = todo.pop(0)
        if rel in seen or len(seen) > 400: continue
        seen.add(rel)
        try: b = get(urllib.parse.urljoin(base, urllib.parse.quote(rel)))
        except Exception as e: info.setdefault('web_errors', []).append([rel, repr(e)]); continue
        fn = os.path.join(d, rel); os.makedirs(os.path.dirname(fn), exist_ok=True); open(fn, 'wb').write(b); got.append([rel, len(b)])
        if rel.endswith(('.html', '.js', '.css', '.json')) and len(b) < 3_000_000:
            t = b.decode('utf-8', 'replace')
            for m in re.findall(r'["\'(]((?:Build|TemplateData|StreamingAssets)/[^"\')?#]+)', t): todo.append(m)
            bu = re.search(r'buildUrl\s*=\s*["\']([^"\']+)', t)
            if bu:
                for m in re.findall(r'buildUrl\s*\+\s*["\']/?([^"\']+)', t): todo.append(bu.group(1).rstrip('/') + '/' + m.lstrip('/'))
    info['web_files'] = got
json.dump(info, open(out + '/info.json', 'w'), indent=1)
print(json.dumps(info, indent=1))
