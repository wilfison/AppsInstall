
function find_universe(){
  is_linux_mint=$(lsb_release -ds | grep 'Linux Mint')

  if [ -z "$is_linux_mint" ]; then
    echo "$(lsb_release -cs)"
    exit
  fi

  linux_mint_version=$(lsb_release -rs | grep -P '(\d{2})' -o)

  if [ "$linux_mint_version" = "20" ]; then
    echo "focal"
    exit
  fi

  echo "jammy"
}
