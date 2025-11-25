.SUFFIXES:
.PHONY: test-datasets all

# bash needed for 'source'ing venv to work
SHELL := /usr/bin/bash

# string macros for using virtual environment and buliding mrd HDF5
venv = source python-ismrmrd-server/.venv/bin/activate 
dcm2h5 = $(venv) && python python-ismrmrd-server/dicom2mrd.py -o $@ $^

# phony build targets
all: test-datasets out/gre_gre_group_image_0_FIRE.gif
test-datasets: in/gre.h5 in/gre_phase.h5 in/mtilt.h5

## test datasets
in/gre.h5: ../../BOLDSliceAngle/Data/2025-10-22/Subject1/DICOM/GRE_FIELDMAP_LARGEFOV_0003/ | in/ python-ismrmrd-server/.venv/
	$(dcm2h5)

in/gre_phase.h5: ../../BOLDSliceAngle/Data/2025-10-22/Subject1/DICOM/GRE_FIELDMAP_LARGEFOV_0004/| in/ python-ismrmrd-server/.venv/
	$(dcm2h5)

in/mtilt.h5: ../../BOLDSliceAngle/Data/2025-10-22/Subject1/DICOM/A_EP2D_BOLD_ANG_N40P20_2MM_ASCEND_INCANG_0005/ | in/ python-ismrmrd-server/.venv/
	$(dcm2h5)

# to view gre as gif before and after inverse contrast tests
out/gre.h5: in/gre.h5
	./run-test.sh
in/gre_dataset_image_0.gif: in/gre.h5
	$(venv) && python python-ismrmrd-server/mrd2gif.py -m $^

out/gre_gre_group_image_0_FIRE.gif: out/gre.h5
	$(venv) && python python-ismrmrd-server/mrd2gif.py -m $^
	

## repo setup
# virtaul env
python-ismrmrd-server/.venv/: | python-ismrmrd-server/
	uv venv python-ismrmrd-server/.venv
	$(venv) && uv pip install -r requirements.txt

# needed submodule at tracked version
python-ismrmrd-server/:
	#originally from git clone https://github.com/kspaceKelvin/python-ismrmrd-server
	git submodule update --init --recursive

# for FIRE sequence addon in scanner
fire_identity/id_rsa.ppk:
	make -C $(dir $@) $(notdir $@)

%/:
	mkdir -p $@
