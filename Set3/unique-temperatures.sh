#!/bin/bash
find lost24/monitor/2011.12.25/ -name hp-temps.txt -exec grep PROCESSOR_ZONE {} \+ | cut -c 77-79 | sort | uniq
