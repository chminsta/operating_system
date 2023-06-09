#!/bin/bash

sudo rsync -av opt/palmdev /opt
sudo rsync -av usr/bin/* /usr/bin
sudo rsync -av usr/share/doc/* /usr/share/doc
sudo rsync -av usr/share/pose /usr/share

sudo chown -R root /opt/palmdev /usr/share/pose /usr/share/doc/pose-3.5 /usr/share/doc/pose-skins-1.9 /usr/bin/pose /usr/bin/pose-profile

sudo chgrp -R root /opt/palmdev /usr/bin/pose /usr/bin/pose-profile /usr/share/pose /usr/share/doc/pose-3.5 /usr/share/doc/pose-skins-1.9

sudo apt install libxext6:i386

