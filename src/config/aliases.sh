net_checker() {
  # check connection on first time
  test=$(curl -Is  http://www.google.com | grep -oE 'OK' | head -n 1)

  # 
  times=1

  # if the result is equal to 1, then there was an error
  while [ "$test" != 'OK' ]; do
    echo -ne "Connection Error! Trying again... ($times) \r"

    # attempts
    times=`expr $times + 1`

    # wait 5 seconds
    sleep 1

    # try again
    test=$(curl -Is  http://www.google.com | grep -oE 'OK' | head -n 1)
  done

  echo "=========================="
  echo "Internet Connection is OK"
  echo "=========================="

  # on successful connection sends a notification
  notify-send 'Internet Checker' 'Internet Connection is OK' -i network-wired -u critical
}

# Set Vs Code as default code editor
export EDITOR="code --wait"

# ==================== GIT ==============================
# shortcode for git status
alias gst="git status"
# use: gpu my-branch
alias gpu="git pull origin"
# use: gps my-branch
alias gps="git push origin"
# run after fixing conflicts
alias gmg="git add . && git merge --continue"
# remove all local branches except master
alias grb='git branch | grep -v "master" | xargs git branch -D'

# =================== Ruby on Rails=======================
# database redo
alias rdb_redo="rails db:drop db:create db:migrate"
# database teste redo
alias rdb_teste="rails db:drop db:create db:migrate RAILS_ENV=test"

# =================== Others =============================

# Check if you have internet connection and show notification if any
alias has_net=net_checker

alias ip_addr="sudo ip -br -c addr show"
alias ip_public="curl --silent ifconfig.me/ip"
