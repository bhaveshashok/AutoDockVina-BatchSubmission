# Batch Submission for AutoDock Vina
 
This script is for use with AutoDock Vina on <b>MacOS</b> and <b>Linux machines</b>.

To use this script, prepare the ligand .pdbqt files and place them into the input folder. The receptor .pdbqt file should be placed in the main directory. The params.txt file should contain all the information inputted into a configuration file for AutoDock Vina (center_x, center_y, center_z, size_x, size_y, size_z define the Grid Box and are required). This should also be put into the main directory. Please refer to the diagram below for the file structure. <b>AutoDock Vina is a prerequisite software needed for this script to work.</b>
```
.
+-- batch
|  +-- input
|     +-- [ligand1].pdbqt
|     +-- [ligand2].pdbqt
|     +-- [...]
|  +-- params.txt
|  +-- [receptor].pdbqt
|  +-- submit.sh
```

The syntax to use the script is as follows: <br>
```
cd ~/path/to/batch/
./submit.sh input [receptor].pdbqt params.txt ~/path/to/Vina/bin/vina
```
<sub>Please note that if the Vina executable is installed in the user's bin folder, you can just use <code> ./submit.sh input [receptor].pdbqt params.txt vina </code></sub>

Please acknowledge use of this script in any publication containing results from the use of this script in the following manner: <i>"Batch Submission Script for AutoDock Vina by Bhavesh Ashok (github.com/bhaveshashok/AutoDockVina-BatchSubmission/)"</i>. Citation of this github repository is also required.
