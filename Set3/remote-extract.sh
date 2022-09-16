#!/bin/bash
ssh localhost "tar xfj ~/Downloads/lost24-monitor-temps-and-fans.tar-v2.bz2"
scp -r localhost:~/lost24 ~/Downloads
