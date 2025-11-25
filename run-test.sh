#!/usr/bin/env bash
PORT=${PORT:-3004}
INFILE=${INFILE:-../in/gre.h5}
OUTFILE=${OUTFILE:-../out/gre.h5}
cd "$(dirname "$0")"
mkdir -p out
# uv venv python-ismrmrd-server/.venv; pip install -r requirements.txt
cd python-ismrmrd-server
source .venv/bin/activate
./main.py -p $PORT &
pid_server=$!
./client.py  -p $PORT -G gre_group -c invertcontrast -o "$OUTFILE" "$INFILE"

kill $pid_server

