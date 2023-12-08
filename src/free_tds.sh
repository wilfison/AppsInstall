set -e

source $APPINST_BASEDIR/src/helpers/colors.sh

freetds_version=$1

# find latest version of FreeTDS ftp://ftp.freetds.org/pub/freetds/stable/
function get_freetds_file_name() {
  wget=$(which wget)
  tds_site_data=$(wget -qO- "https://www.freetds.org/")

  echo $tds_site_data | grep "ftp://ftp.freetds.org/pub/freetds/stable" | grep -Po 'freetds-(.*).tar.gz'
}

if [ -z "$freetds_version" ]; then
  show_info_log "Searching for latest version of FreeTDS"
  freetds_file_name=$(get_freetds_file_name)
  freetds_version=$(awk -F '.tar.gz' '{print $1}' <<<$freetds_file_name)
  show_success_log "Latest version of FreeTDS found: $freetds_version"
else
  freetds_version="freetds-$freetds_version"
  freetds_file_name="$freetds_version.tar.gz"
  show_success_log "Using FreeTDS version: $freetds_version"
fi

[ ! -d "$APPINST_BASEDIR" ] && mkdir "$APPINST_BASEDIR"

show_info_log "Downloading FreeTDS"
cd $APPINST_BASEDIR
wget ftp://ftp.freetds.org/pub/freetds/stable/$freetds_file_name
tar -xzf $freetds_file_name
cd $freetds_version

show_info_log "Installing required components!"
sudo apt install -y build-essential make curl gnupg2 autoconf bison libssl-dev libyaml-dev libreadline-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm-dev libpq-dev ruby-dev software-properties-common

./configure --prefix=/usr/local --with-openssl=/usr/bin
make
sudo make install
show_success_log "Free TDS installed successfully"
