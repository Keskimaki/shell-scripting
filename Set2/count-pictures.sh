#!/bin/bash
rsync --archive /cs/home/tkt_cam/public_html/2011/01/ ~/Repos/shell-scripting/Set2/November-2011

ls -R ~/Repos/shell-scripting/Set2/November-2011 | grep ^.*\.jpg$ | wc -l
