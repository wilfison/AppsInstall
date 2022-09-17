net_checker() {
  # check connection on first time
  test=$(curl -Is http://www.google.com | grep -oE 'OK' | head -n 1)

  #
  times=1

  # if the result is equal to 1, then there was an error
  while [ "$test" != 'OK' ]; do
    echo -ne "Connection Error! Trying again... ($times) \r"

    # attempts
    times=$(expr $times + 1)

    # wait 5 seconds
    sleep 1

    # try again
    test=$(curl -Is http://www.google.com | grep -oE 'OK' | head -n 1)
  done

  echo "=========================="
  echo "Internet Connection is OK"
  echo "=========================="

  # on successful connection sends a notification
  notify-send 'Internet Checker' 'Internet Connection is OK' -i network-wired -u critical
}

# Set Vs Code as default code editor
export EDITOR="code --wait"

# =================== Ruby on Rails=======================
# run rails command inside project
alias r="bin/rails"
# database redo
alias rdb_redo="bin/rails db:drop db:create db:migrate"
# database teste redo
alias rdb_teste="RAILS_ENV=test bin/rails db:drop db:create db:migrate"

# =================== Others =============================

# Check if you have internet connection and show notification if any
alias has_net=net_checker

alias ip_addr="sudo ip -br -c addr show"
alias ip_public="curl --silent ifconfig.me/ip"
