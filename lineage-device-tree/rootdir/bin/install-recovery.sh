#!/vendor/bin/sh
if ! applypatch --check EMMC:/dev/block/by-name/recovery$(getprop ro.boot.slot_suffix):55574528:c1bcbd69c3b0eb95c7db84c5dc830346489aa9e9; then
  applypatch \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/by-name/boot$(getprop ro.boot.slot_suffix):37748736:817a5fd899152f6cd38f14311c97045763b4f2b6 \
          --target EMMC:/dev/block/by-name/recovery$(getprop ro.boot.slot_suffix):55574528:c1bcbd69c3b0eb95c7db84c5dc830346489aa9e9 && \
      (log -t install_recovery "Installing new recovery image: succeeded" && setprop vendor.ota.recovery.status 200) || \
      (log -t install_recovery "Installing new recovery image: failed" && setprop vendor.ota.recovery.status 454)
else
  log -t install_recovery "Recovery image already installed" && setprop vendor.ota.recovery.status 200
fi

