#!/bin/bash

BASEDIR=`pwd`

echo "
#### Preparing system for Simulation ####"

PROGRAM="QIF simulation"
VERSION="0.9"

echo "
The simulation needs the following packages:
 - OpenMP
 - R (base)"
read -p "Do you want to install them?" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo apt-get install lib64gomp1 libgomp1 gnuplot-x11 r-base gsl-bin gsl-doc-info libgsl0-dbg libgsl0-dev libgsl0ldbl 
else
    exit 1
fi

echo "
Creating previously non-existing directory..."
cd src
mkdir current

echo "Compiling parallel version..."
make parallel
cp -r ./current ../v-parallel

echo "Compiling sequential version..."
make 
cp -r ./current ../v-sequential

echo "Cleaning..."
make clean
rm -r current

echo "Done."
exit 0

