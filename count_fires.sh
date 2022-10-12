#!/bin/bash -l

#curl -o calfire.csv https://gis.data.cnra.ca.gov/datasets/CALFIRE-Forestry::recent-large-fire-perimeters-5000-acres.csv?outSR=%7B%22latestWkid%22%3A3857%2C%22wkid%22%3A102100%7D
#nano calfire.csv #deleted spacings between two lines

cut -d, -f2 calfire.csv | sort | head -n 1
cut -d, -f2 calfire.csv | tail -n +2 | sort | tail -n -1
MINYEAR=$(cut -d, -f2 calfire.csv | sort | head -n 1)
MAXYEAR=$(cut -d, -f2 calfire.csv | tail -n +2| sort | tail -n 1)
echo "This report has the years: $MINYEAR-$MAXYEAR"
TOTALFILECOUNT=TOTALFIRECOUNT=$(cut -d, -f2 calfire.csv | tail -n +2 | wc -l)
echo "Number of fires in each year follows: $(cut -d, -f2 calfire.csv | tail -n +2 | sort | uniq -c)"
awk -F, '{print $13,$6}' calfire.csv | sort -n | tail -n 1
LARGEST="August Complex"
LARGESTACRES="1032699.6"
echo "Largest fire was $LARGEST and burned $LARGESTACRES"
for YEAR in $(seq 2017 2021)
do
TOTAL=$(grep $YEAR calfires_2021.csv | awk -F',' '{sum+=$13;} END{print sum;}')
 echo "In Year $YEAR, Total was $TOTAL"
 done
