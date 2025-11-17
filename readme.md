# FIRE on recontwix

## MRD
See [`run-test.sh`](run-test.sh) for [`python-ismrmrd-server`](https://github.com/kspaceKelvin/python-ismrmrd-server)'s `invertcontrast` demo:
![](in/gre_dataset_image_0.gif)
![](out/gre_gre_group_image_0_FIRE.gif)

### MDR Server

[`pymrd.service`](pymrd.service) (hard coded paths) runs and restarts the local MRD server using uv.

TODO: consider setting `TMPDIR` to shared location (`/raidzeus/`?)

Enabled like
```
sudo systemctl enable --system --now $PWD/pymrd.service
```

## Scanner config

 1. `fire_identity/id_rsa.ppk` should be copied to `C:\Medcom\MriCustomer\ice\fire\`
 2. [`wip_1234b_fire_fire_mars_ssh.ini`](wip_1234b_fire_fire_mars_ssh.ini) goes to `%CustomerIceProgs%\fire\wip_fire_fire.ini` (?)


`wip_1234b_fire_fire_mars_ssh.ini` was pulled from the msi installer `WIP1234B_FIRE_VE11C_0809Wed_2021173520:./MriCustomer:./Ice:./fire:./.:n4/.:pkg/MrServers/.:MrVista/.:Config/IceConfigurators/.:fire/wip_1234b_fire_fire_mars_ssh.ini`

### Auth

Putty on windows scan console was used to generate `rsa_id*` (copied to `/mnt/TWIX_RAID/Prisma1/Moon/FIRE/id_rsa*`; 2025/11/17).
> [NOTE!]
> at least for `syngo MR E11`
>  * `rsa_id` should be generated with `-b 2048` not `-b 4096` as documented!
>  * Host key for ini is `RSA` not `ED25519` as documented!

See [`fire_identity/Makefile`](fire_identity/Makefile).
  * `fire_identity/id_rsa.ppk` is the private key to be kept secret and only on the console computer
  * `fire_identity/id_rsa.pub` is public pair and goes into `~/.ssh/authorized_keys` for passwordless authentication

Host key is `4f:9d:13:00:78:dc:e0:25:7f:37:fb:7d:35:8e:65:08` and is specified in  [`wip_1234b_fire_fire_mars_ssh.ini`](wip_1234b_fire_fire_mars_ssh.ini).

Notes on key length
```
wc -l id_rsa linux_generated_bad/id_rsa /tmp/rsa2048
  27 id_rsa
  49 linux_generated_bad/id_rsa
  27 /tmp/rsa2048
```

