#!/bin/bash
# Codemagic (Apple-chip Mac) version of route-source-libgdx.yml: build an open-source libGDX game's own iOS module for the
# ARM simulator and run it with input steps. Usage: ci/libgdx/cm-source.sh <owner/repo> <tag> <Name> <steps name> <wait s> [patch script]
# Results in out/ (SUMMARY in out/sim/sim.md).
set -u
REPO=$1; TAG=$2; NAME=$3; STEPS=$4; WAIT=${5:-60}; PATCH_ARG=${6:-}
cd "$(dirname "$0")/../.." && R=$PWD
sw_vers; uname -m; xcodebuild -version
mkdir -p out
J=$(/usr/libexec/java_home -v 21 2>/dev/null || /usr/libexec/java_home -v 17 2>/dev/null)
[ -n "$J" ] || { brew install --cask temurin@21 > /dev/null 2>&1; J=$(/usr/libexec/java_home -v 21); }
export JAVA_HOME=$J GRADLE_JAVA_HOME=$J PATH="$J/bin:$PATH"; java -version 2>&1 | head -1
[ -d "${ANDROID_SDK_ROOT:-}" ] && export ANDROID_HOME=$ANDROID_SDK_ROOT
echo "ANDROID_HOME=${ANDROID_HOME:-unset}"
git clone -q --depth 1 --branch "$TAG" "https://github.com/$REPO" /tmp/src
export SIM_ARCH=arm64-simulator SKIP_IPA=1
[ -n "$PATCH_ARG" ] && export PATCH="$R/$PATCH_ARG"
ci/libgdx/source-build.sh /tmp/src "$NAME" out ios
APP=$(ls -d out/sim-app/*.app | head -1)
S=ci/sim/steps/$STEPS.txt; [ -f "$S" ] || S=""
ci/sim/run.sh "$APP" out/sim "$WAIT" $S
for l in out/robovm-*.log; do [ -f "$l" ] && { grep -vE "^\[DEBUG\]" "$l" | tail -300 > "$l.tmp" && mv "$l.tmp" "$l"; }; done
rm -rf out/sim-app out/ipa
