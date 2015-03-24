#! /bin/sh

if [ $USER != "root" ]
then
    echo "Insufficient privileges. Please run under root or use sudo."
    exit 1
fi

apt-get install -y aptitude wget curl \
        htop atop dstat sysstat \
        zsh git mercurial vim \
        uwsgi nginx-extras \
        python3-setuptools python-setuptools python-virtualenv \
        uwsgi-plugin-python3 uwsgi-plugins-all uwsgi-plugin-python \
        python3-uwsgidecorators python-uwsgidecorators \
        python-scrapy python-scrapy-doc

wget -O - install.ohmyz.sh | bash
