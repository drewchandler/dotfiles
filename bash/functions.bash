function sv () {
    SECURE_MOUNT_INFO=`hdid $VAULT_DMG | tail -n 1`;
    SECURE_MOUNT_DEVICE=`echo -e $SECURE_MOUNT_INFO | cut -d ' ' -f1`;
    SECURE_MOUNT_PATH=`echo -e $SECURE_MOUNT_INFO | cut -d ' ' -f3`;
    bash --init-file $SECURE_MOUNT_PATH/.profile;
    hdiutil eject $SECURE_MOUNT_DEVICE &> /dev/null;
    unset SECURE_MOUNT_INFO SECURE_MOUNT_PATH SECURE_MOUNT_DEVICE
}

function gri () {
  git rebase -i $1~
}

function gcfri () {
  git commit --fixup $1
  gri $1
}
