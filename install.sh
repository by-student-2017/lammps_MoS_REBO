#!/bin/bash

echo "++++++++++download++++++++++"
sudo apt update
sudo apt install -y libopenmpi-dev
sudo apt install -y g++
sudo apt install -y gcc
sudo apt install -y bulid-essential
sudo apt install -y gfortran
sudo apt install -y liblapack-dev
sudo apt install -y libfftw3-dev
sudo apt install -y fftw-dev
sudo apt install -y python
sudo apt install -y libpython-dev
sudo apt install -y libssl-dev
sudo apt install -y python3
sudo apt install -y csh
#sudo apt install -y zlib1g-dev
sudo apt install -y make
sudo apt install -y cmake
#sudo apt install -y jmol
#sudo apt install -y nkf

lammps_MoS_REBO_PATH=`pwd`

echo "++++++++++lammps++++++++++"
#cd $HOME
#wget https://lammps.sandia.gov/tars/lammps-3Mar20.tar.gz
tar zxvf lammps-3Mar20.tar.gz
sudo apt install unzip
#cd $HOME/lammps_MoS_REBO
cd $lammps_MoS_REBO_PATH
unzip MoS_REBO_fordistribution.zip
#cp pair_rebomos.cpp $HOME/lammps-3Mar20/src
cp pair_rebomos.cpp lammps-3Mar20/src
rm pair_rebomos.cpp
#cp pair_rebomos.h   $HOME/lammps-3Mar20/src
cp pair_rebomos.h   lammps-3Mar20/src
rm pair_rebomos.h
rm MoS.REBO.set5b
#cd $HOME/lammps-3Mar20
cd lammps-3Mar20
mkdir build
cd build
cmake -D BUILD_MPI=on -D PKG_USER-MEAMC=on -D PKG_MANYBODY=on -D PKG_MC=on ../cmake
cmake --build .

#echo "++++++++++environment setting++++++++++"
echo " " >> $HOME/.bashrc
echo "# lammps (REBO, MoS)" >> $HOME/.bashrc
echo "export lammps_MoS_REBO_PATH=$lammps_MoS_REBO_PATH" >> $HOME/.bashrc
echo 'export PATH=$PATH:$lammps_MoS_REBO_PATH/lammps-3Mar20/build' >> $HOME/.bashrc

