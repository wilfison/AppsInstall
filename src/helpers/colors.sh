blue="\e[0;36m"
green="\e[0;32m"
red="\e[1;31m"
yellow="\e[0;33m"
close_color="\e[0m"

show_log(){
  echo -e "\n-----> $1"
}
show_info_log(){
  echo -e "\n$blue-----> $1 $close_color"
}
show_success_log(){
  echo -e "\n$green-----> $1 $close_color"
}
show_warning_log(){
  echo -e "\n$yellow-----> $1 $close_color"
}
show_error_log(){
  echo -e "\n$red ERROR: $1 $close_color"
}

show_info_input(){
  echo -ne "\n$blue-----> $1 $close_color"
}
