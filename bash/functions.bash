function sv () {
    SECURE_MOUNT_INFO=`hdid $VAULT_DMG | tail -n 1`;
    SECURE_MOUNT_DEVICE=`echo -e $SECURE_MOUNT_INFO | cut -d ' ' -f1`;
    SECURE_MOUNT_PATH=`echo -e $SECURE_MOUNT_INFO | cut -d ' ' -f3`;
    bash --init-file $SECURE_MOUNT_PATH/.profile;
    hdiutil eject $SECURE_MOUNT_DEVICE &> /dev/null;
    unset SECURE_MOUNT_INFO SECURE_MOUNT_PATH SECURE_MOUNT_DEVICE
}

function stl {
  local SENTINEL_DIRECTORY="/Users/drew/work/kongregate/config/sentinels"
  if [ -n "$1" ]; then
    local SENTINEL="$SENTINEL_DIRECTORY/$1"
    if [[ ! -f $SENTINEL ]]; then
      local STATUS="\033[1;32mON\033[0m"
      touch $SENTINEL
    else
      local STATUS="\033[1;31mOFF\033[0m"
      rm $SENTINEL
    fi
    echo -e "$1 is now $STATUS"
  fi
  echo -en "\033[1;37mWorking sentinels:\033[0m "
  echo "show_ads cache_classes error_pages screw_routes disable_ssl"
  echo -en "\033[1;37mEnabled sentinels:\033[0m "
  echo -n `ls $SENTINEL_DIRECTORY`
  echo
}

function _stl
{
  COMPREPLY=(`compgen -W 'show_ads cache_classes error_pages screw_routes disable_ssl' -- ${COMP_WORDS[COMP_CWORD]}`)
  return 0
}

complete -F _stl stl

function gri () {
  git rebase -i $1~
}

function gcfri () {
  git commit --fixup $1
  gri $1
}
