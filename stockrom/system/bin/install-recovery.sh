#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 9730048 5d497c7099c4f4fd5df57908b2210611ddd7ccde 6858752 ed575ba197f52e3d04cfd8f1ff750a954ed17a55
fi

if ! applypatch -c EMMC:/dev/block/bootdevice/by-name/recovery:9730048:5d497c7099c4f4fd5df57908b2210611ddd7ccde; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/bootdevice/by-name/boot:6858752:ed575ba197f52e3d04cfd8f1ff750a954ed17a55 EMMC:/dev/block/bootdevice/by-name/recovery 5d497c7099c4f4fd5df57908b2210611ddd7ccde 9730048 ed575ba197f52e3d04cfd8f1ff750a954ed17a55:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
