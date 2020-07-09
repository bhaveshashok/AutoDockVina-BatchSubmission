echo "Batch Submission Script for AutoDock Vina, Bhavesh Ashok"
echo "github.com/bhaveshashok/AutoDockVina-BatchSubmission/"
echo "Please acknowledge your use of this script in your publication using the guidelines on the GitHub page!"


echo "Generating Configurations:"
for ligand in $(ls -1 $1/*.pdbqt)
do
    #echo $ligand
    name=$(echo $ligand | sed 's/.*\///;s/\..*//')
    echo "Generating configuration for $name ..."
    mkdir -p "$name"
    cp $ligand $name
    cp $2 $name
    ligandfname=$(echo $ligand | sed 's/.*\///')
    echo -en "receptor = $2\nligand = $ligandfname\n\n" > "$name/${name}_conf.txt"
    cat $3 >> "$name/${name}_conf.txt"
    echo "Done!"
done

echo "Success: Configurations generated"

echo "Submitting to Vina:"
for ligand in $(ls -1 $1/*.pdbqt)
do
    name=$(echo $ligand | sed 's/.*\///;s/\..*//')
    pushd $name
    echo "Docking $name ..."
    $("$4" --config "${name}_conf.txt" --log "${name}_log.txt")
    popd
    rm $ligand
    echo "Done!"
done

echo "Success: Batch docked"