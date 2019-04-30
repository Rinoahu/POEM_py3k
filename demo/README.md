## Demo

The following is a short walkthrough using a small set of contigs to better illustrate the function and capabilities of POEM. A small data set (35.9MB unzipped) is included as a gzipped fasta file afg.fasta. afg.fasta is a whole genome shotgun sequencing assembly of an ant fungus garden metagenome, Acession number AEWW00000000.1, downloadable from NCBI as AEWW01.1.fsa_nt.gz at https://www.ncbi.nlm.nih.gov/Traces/wgs/AEWW01?display=contigs

## Using POEM

1. Unpack your data: gunzip afg.fasta.gz in the ./POEM_py3k/demo folder
2. Check your data: it's always a good idea to double check the format and contents of your file. Use Head, Less etc to verify that the file is, in this case, a fasta file of assembled contigs
3. Run POEM: now that you've verified that your data is preassembled contigs in fasta format you know which flags to use, enter the following
```
bash ../bin/run_poem.sh -f afg.fasta -a n -p pro

```
-f specifies the file name -a n specifies that the input file is preassembled contigs/genomes, and -p specifies which gene annotation program to use. Check the main readme file for more information on flags and usage
4. Verify your outputs: POEM creates an output folder 'filename_output', afg_output in this case. Once POEM has finished running, enter this directory and check it's contents
```
cd afg_output
ls -sh
```
Make sure the files input.fsa.core_network.sif and input.fsa.core_node.tab are not empty. These are the files you will need to visualize your network, and the last files that POEM generates. The output files are explained in detail in the main readme.

## Visualing your network with Cytoscape

 1. Importing the files: Open cytoscape, click file>import>Network_from_file and select input.fsa.core_network.sif in afg_output. Next click file>import>table_from_file and select input.fsa.core_node.tab . Change "where to import table data" from "to a network collection" to "to selected networks only" and select input.fsa.core_network.sif  

 For the purposes of this demo there is only one network, but later on you may wish to compare multiple networks in the same cytoscape session. You may wish to rename the network files or change their names in cytoscape to avoid confusion & prevent mismatching of tables and networks.

 2. Changing the visualization settings: By default cytoscape will display the network with their COG function numbers only. To increase human readability, we suggest using the following settings. 
 	1. First, click 'style' under the control panel. Click 'Label' and change column to 'function' and mapping type to 'passthrough mapping'. This will replace the COG function labels with the gene annotations produced by Prodigal. 
 	2. Next, click 'fill color' and change column to 'color' and mapping to 'passthrough mapping'. This colorcodes the genes by function. 
 	3. Next click 'Edge' at the bottom of the menu. Click 'Width' and change column to 'interaction' and mapping to 'passthrough mapping'. This will change the connections between genes to visually represent the frequency of their connection. 
 	4. Finally, click 'Label' and change column to 'interaction' and mapping to 'passthrough mapping'. This will put the numeric value of the frequency on each connection.
 3. Look at your data: your full network should now look like this 
 ![Visualization of demo operons](afg.jpeg)
*Figure 2: visualization of core operons from demo assembly file in cytoscape*
You are now ready to use your own data!