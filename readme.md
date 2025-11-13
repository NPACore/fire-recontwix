# FIRE on recontwix

## MRD
See [`run-test.sh`](run-test.sh) for [`python-ismrmrd-server`](https://github.com/kspaceKelvin/python-ismrmrd-server)'s `invertcontrast` demo:
![](in/gre_dataset_image_0.gif)
![](out/gre_gre_group_image_0_FIRE.gif)

### Running

[`pymrd.service`](pymrd.service) (hard coded paths) runs and restarts the local MRD server using uv.

TODO: consider setting `TMPDIR` to shared location (`/raidzeus/`?)

Enabled like
```
sudo systemctl enable --system --now $PWD/pymrd.service
```

## Auth
See [`fire_identity/Makefile`](fire_identity/Makefile).
  * `fire_identity/id_rsa.ppk` should be transfered to console computer
  * `fire_identity/id_rsa.pub` into `~/.ssh/authorized_keys`

Host key is `c0:29:1d:66:4e:65:c6:dd:44:fe:d0:14:9a:23:6b:1a` 
