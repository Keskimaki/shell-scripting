#!/bin/bash
rsync --archive /cs/home/tkt_cam/public_html/$(date +%Y)/$(date +%m)/ ~/Repos/shell-scripting/Set2/$(date +%B)-$(date +%Y)

find ~/Repos/shell-scripting/Set2/$(date +%B)-$(date +%Y) -regex ^.*\.jpg$ -type f | wc -l
