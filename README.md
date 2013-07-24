Lazzzor Puzzle
==============================

This is a tiny script to automatically convert shapfiles to SVG and PDF files for se with a Laser cutter. The script uses [Kartograph.py](http://kartograph.org/docs/kartograph.py/) for this.

## DOCUMENTATION
### Install
Before to start, you have to install Kartograph.py on your pc. Find out more about this at the [documentation](http://kartograph.org/docs/kartograph.py/).

### Execution
First, the script copies all three necessary files of the shapefile (shp, shx, dbf) to get processed afterwards by kartograph.py. The files will be copied to a folder called after the shapefile. In there will be created a json-file

Kartograph.py needs a config in form of a json-file, which will be created and named after the shapefile. After this Kartograph.py converts the shape-file into an svg-file.

At the end, the script converts the svg-file into a pdf.

All files are named after the shapefiles filenames and will be stored in puzzles/ in a subfolder called as the shapefile.

To convert a shape file, go first into the root directory, then execute the script and pass the shapefile as argument. This way, the files will be saved in puzzles/ in a subfolder named after the shapefile.

```shell
sh shape2images.sh FOLDER/FILENAME.shp
```

You also can pass a folder as second argument, to specify the place, where the files will be stored:
```shell
sh shape2images.sh FOLDER/FILENAME.shp NEWFOLDER/
```

This project was an idea of [Michael Bauer](https://twitter.com/mihi_tr) and realized together wit Stefan Kasberger during the Open Week Graz Auswärtsspiel at the [Metalab](https://metalab.at/) on their [Lazzzor](http://lazzzor.soup.io/) in Vienna.

## PARTICIPATE
If you made some new vector files, it would be amazing to share your files with others and merge it with this repo.

**Pleas don't forget to add a LICENSE text for the shape files inside the folders!**

You also can add some functions to the script or add a documentation how to use the lazzzer cutter, which material can be used or what other things can be made out of this. 

## TODO
- colorize the areas after laser cutting
- Multi Layer Puzzle: plate tectonics, continents + sea, nation-states
- inform lazzzor.soup.io

### ToPrint
- plate tectonics
- continents and seas
- nation-states
- languages
- religions
- europe
- austrian municipalities 
- eco zones
- climate zones

