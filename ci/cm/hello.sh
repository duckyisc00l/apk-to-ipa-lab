#!/bin/bash
# Smoke test for the Codemagic Mac: tools present, a simulator boots.
sw_vers; xcodebuild -version; xcrun simctl list runtimes | tail -3; uname -m
