.SHELL: /usr/bin/bash
python-ismrmrd-server/.venv/: | python-ismrmrd-server/
	uv venv python-ismrmrd-server/.venv
	source python-ismrmrd-server/.venv/bin/activate && uv pip install -r requirements.txt

python-ismrmrd-server/:
	#git clone https://github.com/kspaceKelvin/python-ismrmrd-server
	git submodule update --init --recursive
