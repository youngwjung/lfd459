#!/bin/bash
#/* **************** LFD459:1.22.1-u1 s_03/SimpleHarbor.sh **************** */
#/*
# * The code herein is: Copyright the Linux Foundation, 2022
# *
# * This Copyright is retained for the purpose of protecting free
# * redistribution of source.
# *
# *     URL:    https://training.linuxfoundation.org
# *     email:  info@linuxfoundation.org
# *
# * This code is distributed under Version 2 of the GNU General Public
# * License, which you should have received with the source.
# *
# */
#!/bin/bash
# By Tim Serewicz, 1-2021
# Copyright The Linux Foundation, GPL


# Download the online installer and check file

wget https://github.com/goharbor/harbor/releases/download/v2.1.3/harbor-online-installer-v2.1.3.tgz

wget https://github.com/goharbor/harbor/releases/download/v2.1.3/harbor-online-installer-v2.1.3.tgz.asc

# Check that the file is authentic
gpg --keyserver hkps://keyserver.ubuntu.com --receive-keys 644FF454C0B4115C

gpg -v --keyserver hkps://keyserver.ubuntu.com --verify harbor-online-installer-v2.1.3.tgz.asc

# Extract the Harbor software
tar xvf harbor-online-installer-v2.1.3.tgz

# Harbor requires a newer version of docker-compose

sudo curl -L "https://github.com/docker/compose/releases/download/1.18.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

/usr/local/bin/docker-compose -v

# Ready for edits

cp harbor/harbor.yml.tmpl harbor/harbor.yml

echo "Use $(hostname) when editing the harbor.yml file"

echo "Continue with the next step, the prepare script"

