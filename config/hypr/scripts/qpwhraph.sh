#!/bin/bash
pgrep qpwgraph >/dev/null 2>&1 && killall qpwgraph || qpwgraph
