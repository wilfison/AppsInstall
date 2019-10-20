
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
alias has_net="ping 8.8.8.8 -c 10 && notify-send 'Internet is Ok!'"

# Shows what is the ip of your machine on the network (Wifi only)
alias mip="ifconfig wlp1s0"