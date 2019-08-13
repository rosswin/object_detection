#!/bin/bash

#this file is just a wrapper to automate gdal_trace_outline.
#gdal_trace_outline is part of dans-gdal-scripts (https://github.com/gina-alaska/dans-gdal-scripts)

now=$(date +%Y-%m-%d_%H:%M)

mkdir ./cutlines

for i in *.tif; do

  echo "working on: $i";
  no_ext=${i%.*};

  gdal_trace_outline -ndv 0..20 -min-ring-area 100000 -out-cs en -ogr-out ./cutlines/$no_ext.shp $i  2>&1 | tee ./cutlines/gdal_trace_outline_kahoolawe_log_$now.txt

  echo "completed $i";
done
