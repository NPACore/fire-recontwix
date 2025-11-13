venv = source python-ismrmrd-server/.venv/bin/activate 

SHELL=bash
out/gre_gre_group_image_0_FIRE.gif: out/gre.h5
	$(venv) && python python-ismrmrd-server/mrd2gif.py -m $^
	
out/gre.h5: in/gre.h5
	./run-test.sh

SHELL=bash
in/gre.h5 : | in/ python-ismrmrd-server/.venv/
	$(venv) && python python-ismrmrd-server/dicom2mrd.py -o $@  ../../BOLDSliceAngle/Data/2025-10-22/Subject1/DICOM/GRE_FIELDMAP_LARGEFOV_0003/

in/gre_dataset_image_0.gif: in/gre.h5
	$(venv) && python python-ismrmrd-server/mrd2gif.py -m $^

SHELL=bash
python-ismrmrd-server/.venv/: | python-ismrmrd-server/
	uv venv python-ismrmrd-server/.venv
	$(venv) && uv pip install -r requirements.txt

# make sure we have submodule
python-ismrmrd-server/:
	#originally from git clone https://github.com/kspaceKelvin/python-ismrmrd-server
	git submodule update --init --recursive

%/:
	mkdir -p $@
