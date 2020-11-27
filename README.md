# lammps_MoS_REBO


## MoS_REBO_fordistribution
1. cd ~
2. wget https://lammps.sandia.gov/tars/lammps-3Mar20.tar.gz
3. tar zxvf lammps-3Mar20.tar.gz
4. cd ~
5. wget https://research.matse.psu.edu/sinnott/sites/research.matse.psu.edu.sinnott/themes/custom/fb/css/files/MoS_REBO_fordistribution.zip
6. sudo apt install unzip
7. unzip MoS_REBO_fordistribution.zip 
8. cp pair_rebomos.cpp ~/lammps-3Mar20/src
9. cp pair_rebomos.h ~/lammps-3Mar20/src
10. cd lammps-3Mar20
11. mkdir build
12. cd build
13. cmake -D BUILD_MPI=on -D PKG_USER-MEAMC=on -D PKG_MANYBODY=on -D PKG_MC=on ../cmake
14. cmake --build .


## run (thermal conductivity)
1. cd ~/lammps_MoS_REBO/tutorial_thermal_MoS2
2. ~/lammps-3Mar20/build/lmp < in.lmp


## run (elastic at any temperature)
1. cd ~/lammps_MoS_REBO/utorial_elastic_Temp_MoS2
2. ~/lammps-3Mar20/build/lmp < in.elastic
3. python3 compliance_python3.py

## in.lmp
	pair_style      rebomos
	pair_coeff      * * MoS.REBO.set5b M S

## References
[1] https://research.matse.psu.edu/sinnott/software