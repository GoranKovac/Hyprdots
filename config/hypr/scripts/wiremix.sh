#!/bin/bash
pgrep wiremix >/dev/null 2>&1 && killall wiremix || foot -a WIREMIX wiremix
