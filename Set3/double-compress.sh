#!/bin/bash
tar cf - *sh | bzip2 > destination-archive.tar.bz2
tar cf - *sh | gzip > destination-archive.tar.gz
