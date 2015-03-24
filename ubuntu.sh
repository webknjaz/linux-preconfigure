#! /bin/sh

if [ $USER != "root" ]
then
    echo "Insufficient privileges. Please run under root or use sudo."
    exit 1
fi

stat /swapfile2G
if [ $? -ne 0 ]
then
    dd if=/dev/zero of=/swapfile2G bs=1M count=2048
    mkswap /swapfile2G
    echo "/swapfile2G                               swap            swap    defaults,swap     0       0" >> /etc/fstab
    swapon -a
fi

free -m

apt-get -y update && apt-get -y upgrade && \
apt-get install -y aptitude wget curl pv \
        links lynx phantomjs nodejs cron-apt \
        htop atop dstat sysstat syslog-ng \
        zsh git mercurial vim \
        uwsgi nginx-extras \
        python3-setuptools python-setuptools python-virtualenv \
        uwsgi-plugin-python3 uwsgi-plugins-all uwsgi-plugin-python \
        python3-uwsgidecorators python-uwsgidecorators \
        python-scrapy python-scrapy-doc

wget -O - install.ohmyz.sh | bash
