#!/usr/bin/env bash

sqlite_database="/var/www/html/database/mageni.sqlite"
plugin_path="/usr/local/var/lib/mageni/plugins/"
frontend_path="/var/www/html"
frontend_path_tmp="/usr/local/var/lib/mageni/tmp/frontend"
frontend_seeders="/var/www/html/database/seeders"
frontend_log_dir="/var/www/html/storage/logs"
frontend_log_file="/var/www/html/storage/logs/laravel.log"
extract_plugin_path="/usr/local/var/lib/mageni/"
backend_path_tmp="/usr/local/var/lib/mageni/tmp/backend"
mageni_path_tmp="/usr/local/var/lib/mageni/tmp"
mageni_cert_key="/etc/ssl/private/nginx-selfsigned.key"
mageni_cert_crt="/etc/ssl/certs/nginx-selfsigned.crt"

dirhome="/etc/mageni"
logfile="$dirhome/mageni-install.log"
feedlog="$dirhome/mageni-feed-update.log"

cronduser="mageni"
user_pass=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 16 ; echo '')

APTUPDATERUN=0

declare -a ubuntudependencies=(
                        'libssh-dev'
                        'libgnutls28-dev'
                        'libglib2.0-dev'
                        'libpcap-dev'
                        'libgpgme-dev'
                        'libksba-dev'
                        'libsnmp-dev'
                        'libgcrypt20-dev'
                        'libhiredis-dev'
                        'libsqlite3-dev'
                        'uuid-dev'
                        'libical-dev'
                        'libxml2-dev'
                        'libxslt1-dev'
                        'libnacl-dev'
                        'libical3'
                        'snmp'
                        'zip'
                        'p7zip-full'
                        'bison'
                        'nmap'
                        'jq'
                        'systemd'
                        'sqlite3'
                        'gnupg'
                        'smbclient'
                        'gnutls-bin'
                        'redis-server'
                        'nginx'
                        'php8.0-fpm'
                        'php8.0-mbstring'
                        'php8.0-xml'
                        'php8.0-bcmath'
                        'php8.0-cli'
                        'php8.0-sqlite3'
                        'php8.0-curl'
                        )

function set_prompt()
{
  if [ -x /usr/bin/tput ] && tput setaf 1 &> /dev/null; then
    bold=$(tput bold)
    reset=$(tput sgr0)
    red=$(tput setaf 1)
    blue=$(tput setaf 4)
    green=$(tput setaf 2)
    clearscreen=$(tput clear)
  else
    bold="\e[1m"
    reset="\e[0m"
    blue="\e[1;34m"
    green="\e[1;32m"
    red="\e[1;31m"
  fi
}

function msg_bold()
{
  echo -e "${bold}$1${reset}"
}

function msg_normal()
{
  echo -e "         $1"
}

function msg_success()
{
  echo -e "${green}[  OK  ]${reset} $1"
  echo -e "$(date +%m-%d-%Y-%M:%S) [SUCCESS]: $1" >> $logfile
  sleep 1
}

function  msg_normal_wo_arrows()
{
  echo -e "$1"
}

function msg_warn()
{
  echo -e "${red}$1${reset} "
  echo -e "$(date +%m-%d-%Y-%M:%S) [WARNING]: $1" >> $logfile
  sleep 1
}

function msg_welcome()
{
  # shellcheck disable=SC2291
  echo -e     "${clearscreen}"
  msg_bold    "Mageni Installation"
  # shellcheck disable=SC2291
  echo -e     "${reset}"
}

function msg_success_log_scrub()
{
  echo -e "${green}$1${reset} "
  echo -e "$(date +%m-%d-%Y-%M:%S) [SUCCESS]: User ***** and password ***** created successfully. \u2714" >> $logfile
  sleep 1
}

function msg_success_nolog()
{
  echo -e "${green}$1${reset}"
  sleep 1
}

function msg_success_interrupt()
{
  echo -e "${green}[  OK  ]${reset} $1"
  sleep 1
  exit 1
}

function msg_err_interrupt()
{
  echo -e "${red}         $1${reset}"
  echo -e "$(date +%m-%d-%Y-%M:%S) [FAILURE]: $1" >> $logfile
  clean_interrupt_install
  sleep 1
  exit 1
}

function msg_step()
{
  echo -e "${blue}         $1${reset}"
  echo -e "$(date +%m-%d-%Y-%M:%S) [MESSAGE]: $1" >> $logfile
  sleep 1
}

function msg_correct()
{
  echo -e "${red}         $1${reset}"
  echo -e "$(date +%m-%d-%Y-%M:%S) [MESSAGE]: $1" >> $logfile
  sleep 1
}

function msg_prompt()
{
  echo -ne "${blue}         $1${reset}"
  echo -ne "$(date +%m-%d-%Y-%M:%S) [TOKEN]: $1" >> $logfile
}

function msg_prompt_interrupt()
{
  echo -ne "${blue}$1${reset}"
  echo -ne "$(date +%m-%d-%Y-%M:%S) [TOKEN]: $1" >> $logfile
}

function msg_err()
{
  echo -e "${red}         $1${reset}"
  echo -e "$(date +%m-%d-%Y-%M:%S) [FAILURE]: $1" >> $logfile
  clean_interrupt_install
  exit 1
}

function msg_err_nolog()
{
  echo -e "${red}         $1${reset}"
  echo -e "$(date +%m-%d-%Y-%M:%S) [FAILURE]: $1" >> $logfile
  clean_interrupt_install
  exit 1
}

function msg_err_incompatible()
{
  echo -e "${red}         $1${reset}"
  echo -e "$(date +%m-%d-%Y-%M:%S) [FAILURE]: $1" >> $logfile
  clean_interrupt_install
  exit 1
}

function trap_signals()
{
  if grep -q -s DISTRIB_ID=Ubuntu /etc/lsb-release; then
    trap '' SIGUSR2 SIGHUP SIGTSTP SIGQUIT SIGUSR1 SIGTERM
  else
    trap '' SIGUSR2 SIGHUP SIGTSTP SIGQUIT SIGUSR1 SIGTERM
  fi
}

function check_perms()
{
  if ! [ "$(id -u)" = 0 ]; then
    msg_err_nolog "This installation requires sudo."
    exit 1
  fi
}

function discover_hostname()
{
  msg_normal "Finding the hostname"
  if [ "${HOSTNAME:-null}" != null ]; then
    msg_success "Hostname: $HOSTNAME IPv4: $hostname_ip"
  fi
}

function discover_os()
{
  if [ -f /etc/os-release ]; then
    distro_id=$(awk -F'=' '/^ID=/ {print $2}' /etc/os-release | tr -d '"')
    distro_pretty_name=$(awk -F'=' '/^PRETTY_NAME=/ {print $2}' /etc/os-release | tr -d '"')
    distro_version_id=$(awk -F'=' '/^VERSION_ID=/ {print $2}' /etc/os-release | tr -d '"')
  else
    msg_err "Installer must be run on Ubuntu"
  fi

  msg_normal "Review processor architecture"
  ARCH=$(uname -m)
  if [ "$(uname -m)" != "x86_64" ]; then
    msg_err "Installer must be run on a 64 bit version of Linux"
  else
    msg_success "Processor architecture $ARCH"
  fi

  msg_normal "Review version support"
  if [ "$distro_id" == "ubuntu" ]; then
    if [ "$distro_version_id" == "20.04" ] || [ "$distro_version_id" == "22.04" ]; then
      msg_success "$distro_pretty_name is supported"
    else
      msg_err "$distro_pretty_name is not supported. Supported only Ubuntu 20.04"
    fi
  fi
}

function install_curl()
{
  if ! command -v curl > /dev/null 2>&1 ; then
    msg_normal "Updating Ubuntu"
    if DEBIAN_FRONTEND=noninteractive apt update -yq >/dev/null 2>/dev/null; then
      msg_success "Ubuntu Update"
      APTUPDATERUN=1
      msg_normal "Installing curl"
      if DEBIAN_FRONTEND=noninteractive apt install curl -yq --no-install-recommends >/dev/null 2>/dev/null; then
        msg_success "curl installed"
      else
        msg_err "Error while installing curl. Please fix this."
      fi
    fi
  fi
}

function essential_software()
{
  msg_normal "Run Ubuntu Update"
  if DEBIAN_FRONTEND=noninteractive apt update -yq >/dev/null 2>/dev/null; then
    msg_success "Ubuntu Update"
    APTUPDATERUN=1
    if ! command -v whiptail > /dev/null 2>&1 ; then
      msg_normal "Installing whiptail"
      if DEBIAN_FRONTEND=noninteractive apt install whiptail -yq --no-install-recommends >/dev/null 2>/dev/null; then
        msg_success "whiptail installed"
      else
        msg_err "Error installing whiptail"
      fi
    fi
    if ! which jq > /dev/null 2>&1 ; then
      msg_normal "Installing jq"
      if DEBIAN_FRONTEND=noninteractive apt install jq -yq --no-install-recommends >/dev/null 2>/dev/null; then
        msg_success "jq installed"
      else
        msg_err "Error installing jq"
      fi
    fi
  else
    msg_err "Update Failed."
  fi
}

function start_log_file()
{
  if [ -f $logfile ]; then
    rm $logfile
  else
    if ! touch $logfile; then
      msg_err "Error while creating $logfile"
    fi

    if ! touch $feedlog; then
      msg_err "Error while creating $feedlog"
    fi
  fi
}

function selinux_check()
{
  msg_normal "SELinux Review"
  if ! command -v getenforce > /dev/null 2>&1 ; then
    msg_success "SELinux Configuration"
  else
  SELINUXMODE=$(getenforce)
    if [ "$SELINUXMODE" == "Enforcing" ]; then
      msg_err_incompatible "SELinux is set to ${bold}$SELINUXMODE${reset}. Please correct this."
      msg_correct "SELinux $SELINUXMODE mode requires customization. As a workaround use SELinux in Permissive or Disabled mode."
      clean_interrupt_install
    else
      msg_success "SELinux Configuration"
    fi
  fi
}

function disk_check()
{
  msg_normal "Disk Space Health"
  FREE=$(df -k --output=avail "$PWD" | tail -n1)
  if [[ $FREE -lt 4194304 ]]; then
    msg_err "Low disk space available. Recommended capacity is minimum 40GB of free space"
  else
    msg_success "Space available"
  fi
}

function bootstrap_dir_home()
{
  if ! [ -d $dirhome ]; then
    mkdir $dirhome
    sleep 1
  fi
}

function test_internet()
{
  msg_normal "Verifiying Internet"
  website=mageni.net
  if
    nc -zw1 $website 443 && echo |openssl s_client -connect $website:443 2>&1 | awk '
    handshake && $1 == "Verification" { if ($2=="OK") exit; exit 1 }
    $1 $2 == "SSLhandshake" { handshake = 1 }'
  then
    msg_success "Internet is working"
  else
    msg_err "Please fix your connectivity with $website"
    exit 1
  fi
}

function get_ip()
{
  hostname_ip=$(hostname -I | awk '{print $1}')
}

function check_port_https()
{
  msg_normal "Check if port 443 TCP is available"
  if ! command -v ss > /dev/null 2>&1 ; then
    if netstat -tulpn | grep ':443' | grep LISTEN  > /dev/null 2>&1; then
      msg_correct "Port 443 TCP is being used by another application."
      msg_err "How to fix: Mageni requires port 443 TCP, please stop the service running in the port 443 and start again."
    else
      msg_success "Port 443 TCP is available"
    fi
  else
    if ss -lnt "( sport = :443 )" | grep -q LISTEN; then
      msg_correct "Port 443 TCP is being used by another application."
      msg_err "How to fix: Mageni requires port 443 TCP, please stop the service running in the port 443 and start again."
    else
      msg_success "Port 443 TCP is available"
    fi
  fi
}

function update_os()
{
  if [ $APTUPDATERUN -eq 0 ]; then
    msg_normal  "Running apt update"
    if DEBIAN_FRONTEND=noninteractive apt update -yq >/dev/null 2>/dev/null; then
      msg_success "apt-update success"
    else
      msg_err "apt-update error"
    fi
  fi
}

function clean_apt()
{
  msg_normal  "Cleaning cache"
  if DEBIAN_FRONTEND=noninteractive apt clean -yq >/dev/null 2>/dev/null; then
    msg_success "Cache cleaned"
  else
    msg_err "Error cleaning cache"
  fi
}

function install_dependencies()
{
  if [ "$distro_id" == "ubuntu" ]; then
      msg_normal "Installing ${#ubuntudependencies[@]} dependencies"
      for package in "${!ubuntudependencies[@]}"
      do
        msg_normal "Installing Dependency $((package+1)) of ${#ubuntudependencies[@]}"
        if dpkg -s "${ubuntudependencies[package]}" >/dev/null 2>/dev/null; then
            msg_success "Found ${ubuntudependencies[package]}"
          else
          if DEBIAN_FRONTEND=noninteractive apt install "${ubuntudependencies[package]}" -yq --no-install-recommends >/dev/null 2>/dev/null; then
              msg_success "${ubuntudependencies[package]} installed"
            else
              msg_err "Error installing ${ubuntudependencies[package]}. Please contact support@mageni.net"
          fi
        fi
      done
      msg_success "${#ubuntudependencies[@]} dependencies installed successfully."
  fi
}

function mageni_install()
{
  msg_normal "Installing Scanner and Backend"
  if [ -d $extract_plugin_path ]; then 
    rm -rf $extract_plugin_path >/dev/null 2>/dev/null
  fi

  if [ -d $frontend_path ]; then 
    rm -rf $frontend_path >/dev/null 2>/dev/null
  fi

  if [ -f /etc/nginx/sites-enabled/default ]; then
    rm /etc/nginx/sites-enabled/default >/dev/null 2>/dev/null
  fi

  if mkdir -p $backend_path_tmp; then 

  fi

  msg_normal "Generating TLS Certificate"
  if openssl req -x509 -nodes -days 1095 -newkey rsa:4096 -new -subj "/CN=$hostname_ip/emailAddress=support@mageni.net/C=US/ST=NY/L=NY/O=Mageni Security LLC/OU=Mageni" -addext "subjectAltName = IP:$hostname_ip" -keyout $mageni_cert_key -out $mageni_cert_crt >/dev/null 2>/dev/null; then
    msg_success "TLS Certificate Generated"
  else
    msg_err "Error while generating TLS Certificate"
  fi

  msg_normal "Installing frontend"
  if cd_dir "$frontend_path_tmp"; then 

    if curl -s -X GET "$api_endpoint/download/frontend" -H 'Content-Type: application/json' -H "Authorization: Bearer {{ api_key }}" -o frontend.tar.gz; then
      msg_success "Frontend downloaded"
    else
      msg_err_interrupt "Error downloading frontend"
    fi

    msg_normal "Extracting Frontend"
    if ! [ -d $frontend_path ]; then 
      mkdir -p $frontend_path
    fi

    if tar -xzpf frontend.tar.gz -C $frontend_path; then 
      msg_success "Frontend Extracted"
      if ! rm -rf frontend.tar.gz; then
        msg_err "Error removing frontend files"
      fi
    else
      msg_err "Error extracting Frontend"
    fi

    msg_normal "Downloading composer"
    if curl -sS https://getcomposer.org/installer -o composer-setup.php >/dev/null 2>/dev/null; then
      msg_success "Composer download success"
    else
      msg_err_interrupt "Error while downloading composer"
    fi

    msg_normal "Verifying PHP"
    if [ -x /usr/bin/php8.0 ]; then
      msg_success "PHP Exists"
    else
      if DEBIAN_FRONTEND=noninteractive apt install php8.0-fpm php8.0-common php8.0-opcache php8.0-readline php8.0-mbstring php8.0-xml php8.0-bcmath php8.0-cli php8.0-sqlite3 php8.0-curl -yq --no-install-recommends >/dev/null 2>/dev/null; then
        msg_success "PHP Installed"
      else 
        msg_err "Error installing PHP"
      fi
    fi

    msg_normal "Installing composer"
    HASH=$(curl -sS https://composer.github.io/installer.sig)
    if /usr/bin/php8.0 -r "if (hash_file('SHA384', 'composer-setup.php') === '$HASH') { echo '         Composer verified'; } else { echo '         Composer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"; then
      if /usr/bin/php8.0 composer-setup.php --install-dir=/usr/local/bin --filename=composer >/dev/null 2>/dev/null; then
        msg_success "Composer installed"
      else
        msg_err_interrupt "Error installing composer"
      fi
    fi

    msg_normal "Creating SQLite Database"
    if touch $sqlite_database >/dev/null 2>/dev/null; then
      msg_success "SQLite Database created"
    else
      msg_err_interrupt "Error while creating SQLite Database"
    fi

    msg_normal "Creating Log File"
    if mkdir -p $frontend_log_dir >/dev/null 2>/dev/null; then
      msg_success "Log Directory created"
    else
      msg_err_interrupt "Error while creating log directory"
    fi

    if touch $frontend_log_file >/dev/null 2>/dev/null; then
      msg_success "Log File created"
    else
      msg_err_interrupt "Error creating log file"
    fi

    msg_normal "Creating storage folders"
    if mkdir -p $frontend_path/storage/framework/{sessions,views,cache}; then 
      msg_success "Folders created"
    else
      msg_err_interrupt "Error while creating folders"
    fi

    msg_normal "Creating environment file"
    if cd $frontend_path; then 
      if cp .env.example .env; then 
        msg_success "Enviroment file created"
      else
        msg_err_interrupt "Error creating enviroment file"
      fi
    fi

    msg_normal "Setting Environment"
    if export HTTP_PROXY_REQUEST_FULLURI=0 && export HTTPS_PROXY_REQUEST_FULLURI=0; then
      if env | grep HTTP_PROXY_REQUEST_FULLURI >/dev/null 2>/dev/null; then 
        if env | grep HTTPS_PROXY_REQUEST_FULLURI >/dev/null 2>/dev/null; then 
          msg_success "Environment set"
        fi
      fi
    else 
      msg_err "Error setting the enviroment"
    fi

    msg_normal "Installing Composer Packages. Please wait"
    if cd $frontend_path; then 
      export COMPOSER_ALLOW_SUPERUSER=1;
      if composer install --no-interaction --prefer-dist --optimize-autoloader >/dev/null 2>/dev/null; then
        msg_success "Composer Packages Installed"
      else
        msg_err_interrupt "Composer Packages Fail"
      fi
    fi

    if [ -f /etc/init.d/php8.0-fpm ]; then
      ACTIVE=$(/etc/init.d/php8.0-fpm status | grep Active: | awk '{print $2}')
      if [[ $ACTIVE == 'active' ]]; then
        msg_normal "Reloading PHP-FPM"
        if echo "" | sudo -S service php8.0-fpm reload >/dev/null 2>/dev/null; then
          msg_success "PHP-FPM Reloaded"
        else
          msg_err "Error while reloading PHP-FPM"
        fi
      else
         if [[ $ACTIVE == 'inactive' ]]; then
           msg_normal "Starting PHP-FPM"
           if echo "" | sudo -S service php8.0-fpm start >/dev/null 2>/dev/null; then
             msg_success "PHP-FPM Started"
           else
             msg_err "Error while starting PHP-FPM"
           fi
         fi
      fi
    fi

    msg_normal "Creating key"
    if /usr/bin/php8.0 artisan key:generate >/dev/null 2>/dev/null; then 
      msg_success "Key created"
    else
      msg_err_interrupt "Error creating key"
    fi

    msg_normal "Running Database Migrations"
    if /usr/bin/php8.0 artisan migrate --force >/dev/null 2>/dev/null; then 
      msg_success "Migration Success"
    else
      msg_err_interrupt "Migration Failed"
    fi

    msg_normal "Configuring permissions"
    if cd $frontend_path; then 
      if chown www-data:www-data -R ./* >/dev/null 2>/dev/null; then
        msg_success "Permissions set"
      else
        msg_err_interrupt "Permissions Failed"
      fi
    fi

    msg_normal "Setting frontend files permissions"
    if cd $frontend_path; then
      if find . -type f -exec chmod 644 {} \; ; then
        msg_success "Frontend file permissions set"
      else
        msg_err "Frontend file permissions failed"
      fi
    fi

    msg_normal "Setting frontend directory permissions"
    if cd $frontend_path; then
      if find . -type d -exec chmod 755 {} \; ; then
        msg_success "Frontend directory permissions set"
      else
        msg_err "Frontend directory permissions failed"
      fi
    fi

    msg_normal "Creating user administrator"
    
    user_name=$(curl -s -X GET "$api_endpoint/user" -H 'Content-Type: application/json' -H "Authorization: Bearer {{ api_key }}" | jq -r '.name')
    user_email=$(curl -s -X GET "$api_endpoint/user" -H 'Content-Type: application/json' -H "Authorization: Bearer {{ api_key }}" | jq -r '.email')

    if cd $frontend_seeders; then
      sed -i -e "s/ReplaceUser/$user_name/g" UserSeeder.php >/dev/null 2>/dev/null
      sed -i -e "s/ReplaceEmail/$user_email/g" UserSeeder.php >/dev/null 2>/dev/null
      sed -i -e "s/ReplacePassword/$user_pass/g" UserSeeder.php >/dev/null 2>/dev/null
    fi

    if cd $frontend_path; then
      if /usr/bin/php8.0 artisan db:seed --class=UserSeeder >/dev/null 2>/dev/null; then
        msg_success "User created"
      else
        msg_err_interrupt "Error creating user $user_email"
      fi
    fi

    if cd $frontend_path; then
      if /usr/bin/php8.0 artisan db:seed --class=PermissionsSeeder >/dev/null 2>/dev/null; then
        msg_success "Permissions seeded"
      else
        msg_err_interrupt "Error seeding permissions"
      fi
    fi

    msg_normal "Configuring the feed"

    feed_version=$(curl -s -X GET "$api_endpoint/feed/version" -H 'Content-Type: application/json' -H "Authorization: Bearer {{ api_key }}" | jq -r '.feed')

    frontend_version=$(curl -s -X GET "$api_endpoint/frontend/version" -H 'Content-Type: application/json' -H "Authorization: Bearer {{ api_key }}" | jq -r '.frontend')

    backend_version=$(curl -s -X GET "$api_endpoint/backend/version" -H 'Content-Type: application/json' -H "Authorization: Bearer {{ api_key }}" | jq -r '.backend')

    sqlite3 $sqlite_database "insert into version (api_key, feed, frontend, backend) values (\"{{ api_key }}\", \"$feed_version\", \"$frontend_version\", \"$backend_version\")"

    msg_success "Feed configured"

    if ! sudo sed -i -e "s/APP_ENV=local/APP_ENV=production/g" /var/www/html/.env; then
      msg_err "Error configuring the environment"
    fi

  fi

  if cd $frontend_path; then 
    chown www-data:www-data -R ./* >/dev/null 2>/dev/null;
  fi

  msg_success "Frontend installed"
}

function systemd_init()
{
  msg_normal "Configuring systemd"

  if [ "$distro_id" == "ubuntu" ]; then
    if ! systemctl enable /usr/local/share/doc/mageni-scanner/redis_config/mageni-vscand.service >/dev/null 2>/dev/null; then
      msg_err_interrupt "Error while installing Mageni SQLite systemd unit"
    fi
  fi

  if [ "$distro_id" == "ubuntu" ]; then
    if ! systemctl enable /usr/local/share/doc/mageni-scanner/redis_config/mageni-sqlite.service >/dev/null 2>/dev/null; then
      msg_err_interrupt "Error while installing Mageni SQLite systemd unit"
    fi
  fi

  msg_success "systemd configured"
}

function configure_ldd()
{
  msg_normal  "Configuring binaries"

  if ! echo "/usr/local/lib" > /etc/ld.so.conf.d/mageni-libraries.conf; then
    msg_err "Error while adding local library path"
  fi

  if ldconfig; then
    msg_success "Binaries Configured"
  fi
}

function configure_tls_certs()
{
  msg_normal "Configuring Certificates"

  if mageni-manage-certs -fa >/dev/null 2>/dev/null; then
    msg_success "Certificates Configured"
  else
    msg_normal "Error while configuring TLS Certificates"
  fi
}

function token_register()
{
  msg_normal "Contacting Mageni to verify the token"
  token_status=$(curl -s -X GET "$api_endpoint/token/status" -H 'Content-Type: application/json' -H "Authorization: Bearer {{ api_key }}" | jq -r '.status')
  if [ "$token_status" == "verified" ]; then
    msg_success "Token verified"
  else
    msg_err "Error verifiying the token. Please contact support."
  fi
}

function clean_interrupt_install()
{
  msg_normal "Cleaning files"
  if rm -rf $dirhome >/dev/null 2>/dev/null; then
    msg_success_interrupt "Installation successfully interrupted and the files were removed"
  else
    msg_err_interrupt "Error while removing $dirhome. Please run: rm -rf $dirhome"
  fi
  msg_success_interrupt "Success cleaning files"
}

function successful_install()
{
  login_msg
}

function cd_dir()
{
  if ! [ -d "$1" ] ; then 
    if mkdir -p "$1" ; then 
      if ! cd "$1" ; then
        msg_err "Error cd1@cd_dir into \"$1\""
      fi
    else 
      msg_err "Error mkdir@cd_into"
    fi
  else
    if ! cd "$1" ; then
      msg_err "Error cd2@cd_dir info \"$1\""
    fi
  fi
}

function get_plugins()
{
  msg_normal "Installing Knowledge Base. Please wait"

  if cd_dir $mageni_path_tmp; then   
    
    if ! curl -s -X GET "$api_endpoint/download/feed" -H 'Content-Type: application/json' -H "Authorization: Bearer {{ api_key }}" -o plugins.tar.gz >/dev/null 2>/dev/null; then
      msg_err "Error downloading Knowledge Base"
    fi

    if [ -d $plugin_path ]; then 
      rm -rf $plugin_path >/dev/null 2>/dev/null      
    fi

    if tar -xzpf plugins.tar.gz -C $extract_plugin_path; then 
      if ! rm -rf plugins.tar.gz; then
        msg_err "Error removing plugins.tar.gz"
      fi
    else
      msg_err "Error decompressing Knowledge Base"
    fi

  fi

  msg_success "Knowledge Base Installed" 
}

function start_services()
{
  msg_normal "Starting Mageni Services"

  if systemctl start mageni-vscand >/dev/null 2>/dev/null; then
    if systemctl start mageni-sqlite >/dev/null 2>/dev/null; then
      msg_success "Mageni Services Started"
    else
      msg_err "Error while starting Mageni Database"
    fi
  else
    msg_err "Error while starting Mageni Scanner"
  fi

  sleep 1
  {
      percentage="0"
      while (true)
      do
          proc=$(ps aux | grep -E "(mageni-sqlite)" | grep "Reloading")
          if [[ "$proc" == "" ]] && [[ "$percentage" -eq "0" ]];
          then
              break;
          elif [[ "$proc" == "" ]] && [[ "$percentage" -gt "0" ]];
          then
              sleep 2
              echo 98
              sleep 1
              echo 99
              sleep 1
              echo 100
              sleep 1
              break;
          elif [[ "99" -eq "$percentage" ]]
          then
              percentage="90"
          fi
          sleep 1
          echo $percentage
          percentage=$(expr $percentage + 1)
      done
  } | whiptail --title "Database" --gauge "Updating Database" 6 50 0
}

function create_user_sqlite()
{  
  if ! /usr/local/sbin/mageni-sqlite --create-user=admin --role=Admin --password=admin >/dev/null 2>/dev/null; then
      msg_err "Error Creating SQLite User"
  fi
}

function configure_database()
{
  msg_normal "Configuring Database"

  if chown www-data:www-data /usr/local/var/lib/mageni/sqlite/sqlite.d* >/dev/null 2>/dev/null ; then 
    msg_success "Database group set"
  else
    msg_err "Error setting database group"
  fi
  
  if chown www-data:www-data /usr/local/var/run/mageni-sqlite.sock >/dev/null 2>/dev/null; then 
    msg_success "Unix Domain Socket Permission Set"
  else
    msg_err "Error setting Unix Domain Socket permissions"
  fi

  msg_success "Database configured"
}

function login_msg()
{
  install_status=$(curl -s -X GET "$api_endpoint/software/install" -H 'Content-Type: application/json' -H "Authorization: Bearer {{ api_key }}" | jq -r '.status')
  echo -e ""
  msg_normal_wo_arrows "Hi $user_name"
  echo -e ""
  msg_normal_wo_arrows "$install_status 🎉"
  echo -e ""
  msg_normal_wo_arrows "Your credentials"
  echo -e ""
  msg_normal_wo_arrows "${bold}Username:${reset} $user_email"
  msg_normal_wo_arrows "${bold}Password:${reset} $user_pass"
  msg_normal_wo_arrows "${bold}Web UI:${reset} https://$hostname_ip"
  echo -e ""
  msg_normal_wo_arrows "${bold}Would you like to show some love by starring the GitHub repo?${reset}"
  echo -e ""
  msg_normal_wo_arrows "GitHub: https://github.com/mageni/mageni "
  echo -e ""
  msg_normal_wo_arrows "${bold}For your security${reset}"
  echo -e ""
  msg_normal_wo_arrows "1. Change the password"
  msg_normal_wo_arrows "2. Activate MFA"
  msg_normal_wo_arrows "3. Add the Web Server certificate to your Web Browser"
  echo -e ""
  cat $mageni_cert_crt
  echo -e ""
}

function create_user_crond()
{
  msg_normal  "Creating system account "
	if grep -E "^$cronduser" /etc/passwd >/dev/null 2>/dev/null; then
		msg_err "$cronduser exists"
	else
    if useradd -r -g sudo $cronduser >/dev/null 2>/dev/null; then 
      msg_success "System account created"
    else
      msg_err "Creation of system account failed"
    fi
  fi
}

function restart_cron()
{
  msg_normal  "Restarting cron"
	if /etc/init.d/cron restart >/dev/null 2>/dev/null; then
    msg_success "Cron restarted"
  else
    msg_err "Error while restarting cron"
  fi
}

function start_nginx()
{
  if systemctl restart nginx; then
    msg_success "Webserver started"
  else
    msg_err "Error starting webserver"
  fi
}

function no_ctrlc()
{
  msg_prompt_interrupt "Do you want to cancel the installation? (yes/no) [Default=no]"
  read -r RESP
  if [ "$RESP" = "yes" ]; then
    msg_warn "Interrupting installation"
    clean_interrupt_install
  else
    msg_normal "Restarting installation."
  fi
}

function start_install()
{
  set_prompt
  msg_welcome
  trap_signals
  check_perms
  bootstrap_dir_home
  start_log_file
  install_curl
  disk_check
  essential_software
  get_ip
  selinux_check
  test_internet
  check_port_https
  discover_hostname
  discover_os
}

  trap no_ctrlc 2
  start_install
  token_register
  update_os
  install_dependencies
  mageni_install
  systemd_init
  configure_ldd
  configure_tls_certs
  get_plugins
  start_services
  create_user_sqlite
  configure_database
  create_user_crond
  restart_cron
  start_nginx
  clean_apt
  trap successful_install EXIT