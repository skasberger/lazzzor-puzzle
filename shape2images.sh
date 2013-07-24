#/bin/sh


#
# Function to check if all files of shape for kartograph.py exists (*.shp, *.shx, *. dbf)
#
checkShape()
{
	folder=$1
	filename=$2
	if [ ! -f $folder$filename".shp" ] || [ ! -f $folder$filename".shx" ] || [ ! -f $folder$filename".dbf" ]; then
    	echo "Error: Some files are missing!"
		exit 1
	fi

	echo "All shapefiles available"
	return $TRUE
}


#
# Function to create JSON file, convert shapefiles into pdf and svg
#
convertShape()
{
	local folder=$1
	local filename=$2

	local json=$folder$filename".json"
	local pdf=$folder$filename".pdf"
	local svg=$folder$filename".svg"

	# create json file 
	echo '{\n\t"layers": [{\n\t\t"src": "'$folder$filename'.shp"\n\t}],\n\t"export": {\n\t\t"width": 600,\n\t\t"height": 600\n\t}\n}' >> $json

	# call kartograph.py
	kartograph $json -o $svg
	
	# export svg file to pdf
	inkscape --without-gui --export-pdf=$pdf $svg

	return $TRUE
}


#
# Function to copy shape files to the new folder
#
copyShapes()
{
	source=$1
	target=$2
	filename=$3

	# copy shape file
	if [ -d $target ]; then
		echo "Error: Folder already exists!"
		exit 
	fi
	mkdir $target

	# copy shx und dbf files too
	cp $source$filename".shp" $target
	cp $source$filename".shx" $target
	cp $source$filename".dbf" $target
}


# no parameter passed => Error
if [ $# -eq 0 ]; then
	echo "Error: No shapefile specified"
	exit 1
fi

# two or more parameter passed => invalid 
if [ $# -gt 3 ] ; then
	echo "Error: Too many variables passed"
	exit 1
fi

# check if argument is a file
if [ ! -f $1 ]; then
	echo "Error: Argument is no file"
	exit 1
fi

# a file passed as parameter
if [ -f $1 ]; then
	
	# get the source folder via regex
	source=$(echo $1 | sed 's/[0-9a-zA-Z_-]*.shp//g')

	# get the filename via regex
	filename=$(echo $(echo $1 | sed 's/[0-9a-zA-Z_-]*\///g' | sed 's/.shp//g'))
	# set the target folder by default
	target="puzzles/"$filename"/"

	# set the target folder by argument 2
	if [ $# -eq 2 ]; then
		target="puzzles/"$(echo $2 | sed 's/\///g')"/"
	fi

	# check shapefile
	checkShape $source $filename

	# copy shapefiles
	copyShapes $source $target $filename

	# convert shapefile to images
	convertShape $target $filename

fi

echo "\n***   Please don't forget to add a LICENSE file for   ***\n***   the shape file to the created puzzle folder!    ***\n" 

exit 0

