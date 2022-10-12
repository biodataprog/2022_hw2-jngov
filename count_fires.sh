#!/bin/bash -l

# step to write
# download the CSV file
# curl -o calfire.csv ...
curl -o calfire.csv https://gis.data.cnra.ca.gov/datasets/CALFIRE-Forestry::recent-large-fire-perimeters-5000-acres.csv?outSR=%7B%22latestWkid%22%3A3857%2C%22wkid%22%3A102100%7D

# print out the range of years found -- you may need to go in and edit the file
# cut -d, ....
nano calfire.csv #deleted spacings between two lines
cut -d, -f2 calfire.csv | sort | head -n 1
cut -d, -f2 calfire.csv | sort | tail -n 2 #header
MINYEAR=$(cut -d, -f2 calfire.csv | sort | head -n 1)
MAXTYEAR=$(cut -d, -f2 calfire.csv | tail -n +2| sort | tail -n 1)
# write code to set these variables with the smallest and largest years
echo "This report has the years: $MINYEAR-$MAXYEAR"
# if you have problems the CSV file already part of this repository so you can use 'calfires_2021.csv'

# print out the total number of fires (remember to remove the header line)
cut -d, -f2 calfire.csv | tail -n +2 | wc -l
TOTALFILECOUNT=134
# put your code here to update this variable
echo "Total number of files: $TOTALFILECOUNT"

# print out the number of fire in each year
cut -d, -f2 calfire.csv | tail -n +2 | uniq -c
echo "Number of fires in each year follows:"
echo "Number of fires in each year follows: $(cut -d, -f2 calfire.csv | tail -n +2 | sort | uniq -c)"

awk -F, '{print $13,$6}' calfire.csv | sort -n | tail -n 1
LARGEST="August Complex"
LARGESTACRES="1032699.6"
# print out the name of the largest file use the GIS_ACRES and report the number of acres
echo "Largest fire was $LARGEST and burned $LARGESTACRES"

for YEAR in $(seq 2017 2021)
do
TOTAL=$(grep $YEAR calfires_2021.csv | awk -F',' '{sum+=$13;} END{print sum;}')
 echo "In Year $YEAR, Total was $TOTAL"
 done
# print out the years - change the code in $(echo 1990) to print out the years (hint - how did you get MINYEAR and MAXYEAR?
for YEAR in $(echo 1990)
do
#      TOTAL=$(grep ... | awk ...)
      echo "In Year $YEAR, Total was $TOTAL"
done

for YEAR in $(seq 2017 2021)
do
TOTAL=$(grep $YEAR calfires_2021.csv | awk -F',' '{sum+=$13;} END{print sum;}')
 echo "In Year $YEAR, Total was $TOTAL"
 done
