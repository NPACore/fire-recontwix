#!/usr/bin/env bash
cd "$(dirname "$0")"
mkdir -p out
# uv venv python-ismrmrd-server/.venv; pip install -r requirements.txt
cd python-ismrmrd-server
source .venv/bin/activate
./main.py -v &
pid_server=$!
./client.py -G gre_group -c invertcontrast -o ../out/gre.h5 ../in/gre.h5

kill $pid_server

