# Protection fixtures (one sign planted into a real clean app)

**14/14 planted signs flagged, clean apps unflagged.**

| case | app | clean app flags | flags after planting | result |
|---|---|---|---|---|
| Jiagu library | java | none | packed: Jiagu (Qihoo 360) | pass |
| Jiagu stub class | java | none | packed: Jiagu (Qihoo 360) | pass |
| Bangcle library | java | none | packed: Bangcle | pass |
| Legu library | java | none | packed: Tencent Legu | pass |
| SecNeo DexHelper | java | none | packed: SecNeo / Bangcle DexHelper | pass |
| ijiami asset | java | none | packed: ijiami | pass |
| pairip | java | none | integrity: Google Play automatic protection (pairip): some code runs in a VM | pass |
| no dex, no libs | java | none | packed: no classes.dex and no native libraries | pass |
| dex not a dex | java | none | packed: classes.dex is not a dex file | pass |
| Cordova crypt-file | java | none | encrypted: Cordova encrypted web files (cordova-plugin-crypt-file) | pass |
| IL2CPP metadata | unity | none | encrypted: Unity IL2CPP global-metadata.dat encrypted or changed (wrong magic) | pass |
| GameMaker data | gm | none | encrypted: GameMaker data file encrypted or changed (no FORM header) | pass |
| Cocos .jsc | java | none | encrypted: Cocos scripts compiled/encrypted (.jsc x1): needs the XXTEA key from the engine library | pass |
| Godot .gde | java | none | encrypted: Godot 3 encrypted scripts (.gde) | pass |
