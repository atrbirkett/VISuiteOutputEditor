# VI-Suite Illuminance Data Processing Script

## Overview
This R package processes output .csv data from VI-Suite, an addon for Blender 3D content creation application. It's designed for studies examining illumination across various dates, focusing on four seasonal dates (Summer Solstice, Autumn Equinox, Winter Solstice, Spring Equinox) and multiple hours within those seasons across multiple analysis planes in each "Room" of a structure.

This script was developed as part of Alexander Birkett's PhD project, "Virtual Ruins, Real Insights: Establishing A Framework for three-dimensional Modelling in Archaeology."

## VI-Suite and Blender
The VI-Suite is an addon for Blender, functioning as a pre/post processor for Radiance and EnergyPlus building simulation tools, and providing various building context analyses. Like Blender, Radiance, EnergyPlus, and OpenFOAM, the VI-Suite is free, open-source, and multi-platform. Its deep integration with Blender offers several capabilities:

- **Flexible Interface:** Utilizes Blender’s node system for a user-friendly experience.
- **Geometry Specification:** Employs Blender’s advanced material and geometry tools for defining building geometry.
- **Dynamic Analyses:** Integrates Blender’s animation system for both parametric and static analyses.
- **Custom Functions:** Allows manual editing of simulation input files and writing custom functions via Blender’s text editor.
- **Animation Creation:** Uses Blender’s video sequence editor for animations of parametric analyses.
- **Visualisation:** Leverages Blender’s material system for scene-based visualization of results.
- **Information Display:** Implements Blender’s OpenGL interface for creating heads-up displays.
- **Additional Tools:** Incorporates matplotlib for 2D result plotting and Kivy for simulation monitoring.

The use of VI-Suite and Blender is essential for the data this script processes.

## Citation
This software can be cited with the following DOI:
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.5957132.svg)](https://doi.org/10.6084/m9.figshare.24552889)

## Requirements
- R Programming Language
- R Libraries: `dplyr`, `readr`
- Blender (with VI-Suite addon)

## Installation
1. **R Installation:** Download R from [The Comprehensive R Archive Network (CRAN)](https://cran.r-project.org/).
2. **Library Installation:** Install `dplyr` and `readr` libraries in R.
   ```R
   install.packages("dplyr")
   install.packages("readr")

3. **Blender Installation:** Ensure Blender is installed and VI-Suite addon is added. Blender can be downloaded from [Blender's official website](https://www.blender.org/).

## Usage
1. Place your VI-Suite generated CSV files in a designated folder.
2. Open the script in RStudio or another R environment.
3. Set `num_files` to match the number of input files.
4. Modify `test_names` for your specific seasonal tests.
5. Run the script for processing and output generation.

## Input File Format
Input CSV files should be named as `Input_XXX.csv`, where `XXX` is a sequential number. They should contain structured illuminance data for the script.

## Output
The script generates `Season_XXX_summary.csv` files, representing processed data for each season or test.

## Customization
Modify the script as needed to fit specific requirements of your workflow.

## Support
For queries or issues, please open an issue on this GitHub repository.
