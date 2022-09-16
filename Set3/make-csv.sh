#!/bin/bash
find lost24/monitor/2011.12.25/ -name hp-temps.txt -exec grep PROCESSOR_ZONE {} \+ | sed -e "s/  */,/g" -e "s/\//,/g"
