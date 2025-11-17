id_rsa.ppk: id_rsa
	puttygen $^ -o $@
id_rsa:
	ssh-keygen -t rsa -b 2048 -f $@
	# cat id_rsa.pub  >> ~/.ssh/authorized_keys
SHELL=bash
recontwix_rsa_md5.txt:
	ssh-keyscan localhost | ssh-keygen -E md5 -l -f - |& perl -lne 'print $$1 if m/MD5:(.*?) .*RSA/' > $@
