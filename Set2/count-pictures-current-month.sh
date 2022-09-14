#!/bin/bash
rsync --archive /cs/home/tkt_cam/public_html/$(date +%Y)/$(date +%m)/ ~/Repos/shell-scripting/Set2/$(date +%B)-$(date +%Y)

ls -R ~/Repos/shell-scripting/Set2/$(date +%B)-$(date +%Y) | grep ^.*\.jpg$ | wc -l
