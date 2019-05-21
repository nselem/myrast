# myrast
myrast dockerfile 
This is myrast distribution on a docker file. To use myrast you need a RAST account. BEside upload and retrieve genomes that are the functionalities described here, other [myrast commands](http://blog.theseed.org/servers/usage/the-rast-batch-interface.html) can be used with this docker distribution.    

## Download myrast docker distribution   
Once you have docker installed, pull the myrast dcker distribution.  
`docker pull nselem/myrast`  

## Open myRast terminal   
`docker run -i -t -v $(pwd):/home nselem/myrast /bin/bash`
## Use myRast  
Now you can use myRast:  
-To upload fasta/genbank  
`svr_submit_RAST_job -user <user> -passwd <pass> -fasta <file> -domain Bacteria -bioname "Organism name" -genetic_code 11 -gene_caller rast`  
  
Note On -bioname it is important that the first letter is capital and all the others lowercase, as on scientific names.  
  
-To download files:  
`svr_retrieve_RAST_job <user> <password> <jobId> table_txt > $ID.txt`  
  
if you have a list of files, you can process it with bash. For example to download a list of RAST files, store the RAST Id numbers on a file, (Rast_ID on this example) and use a while from bash to retrieve them:  
  
On this case the variable "line" will contain a RAST Id number, and each amino acid file from a RAST Id will be downloaded and stored on "$line.faa"    
`cut -f1 Rast_ID | while read line; do  svr_retrieve_RAST_job <user> <password> $line amino_acid > $line.faa ; done`


### Rast formats to retrieve files.
You can change the format table_txt for whatever format you need.  


| Attribute               | Description                                               |  
| :---------------------- | :-------------------------------------------------------- |  
| genbank                 | GenBank (with SEED function conventions and enhancements) |  
| genbank_stripped        | GenBank with EC-numbers stripped from functions           |  
| embl                    | EMBL (with SEED function conventions and enhancements)    |  
| embl_stripped           | EMBL with EC-numbers stripped from functions              |  
| gff3                    | GFF3                                                      |  
| gff3_stripped           | GFF3 with EC-numbers stripped from functions              |  
| gtf                     | GTF                                                       |  
| gtf_stripped            | GTF with EC-numbers stripped from functions               |  
| rast_tarball            | gzipped tar archive of the RAST genome directory          |  
| nucleic_acid            | DNA for genes                                             |   
| amino_acid              | Protein translations for genes                            |  
| table_txt               | Gene data in tab-separated format                         |  
| table_xls               | Gene data in EXCEL format                                 |   


## Extra features of docker-myrast.  
1. Download genomes from NCBI.  
2. Upload genomes to RAST.  
3. Download genomes to RAST.  

## 1 Download genomes from NCBI
**Input Files:**
Id_NCBI file (File with the genome ids from NCBI you wish to upload to RAST)  
1.NCBI_and_RAST script from GitHub  
`perl 1.NCBI_and_RAST Id_NCBI  `
NOTE: To run the 1.NCBI_and_RAST script, it will be done inside the docker, in the myrast option

**1.1 Id_NCBI file**
Prepare the file Id_NCBI. It should be a text file with two columns. The first column filled with NCBI Ids, the second column should contain the organism's genus with the species name. The two columns must be tab separated. Accepted IDs: You can only use ids from the NCBI databases protein, nucleotide and genome.

NOTE: To see the status of the job, type: $svr_status_of_RAST_job user password jobID
If you want to review other options, could visit http://blog.theseed.org/servers/usage/the-rast-batch-interface.html



Figure 1- File with NCBI Id’s, genus and species names.

You can look for the NCBI ids from the following links: 
Assembly NCBI
Genoma NCBI
Note. Please check that your organism name is correctly written. And that is only the First letter of the genus must be capital. Names like CORYNEBACTERIUM ACCOLENS ATCC 49725 won't be accepted, you must write  Corynebacterium accolens atcc 49725 instead. You can use in excel or libre office the option Format->Change Capitals (feature not present in google drive).

To download genomes without using RAST please comment line 20 adding a character # at the beginning of line, Figure 2. Save your changes. 

Figure 3. Modify line 20 if you are not planning to use RAST, and this is if you only want to download genomes from NCBI.

Finally, run the script:     
`perl 1.NCBI_and_RAST Id_NCBI`

## 2. RAST upload genomes  
**Input files** 
Id_NCBI file (File with the genome ids from NCBI you wish to upload to RAST)
1.NCBI_and_RAST script from GitHub  
`1.NCBI_and_RAST Id_NCBI file user pass`    

**Id_NCBI file** 
Follow the instructions in the page above.

## 3. RAST retrieve genomes   
**Input Files:**
RAST_id  file with your RAST ids
2.Batch_RetrievesFiles.pl script from GitHub
`2.Batch_RetrieveFiles.pl RAST_id`

**3.1. Id_RAST file**
From your jobs overview personal website, copy the job, the id and the  organism name columns in a text tab separated file. See the anexo if you don't know how to create a tab separated file.

Figure 5. Get your jobs id from RAST website.

Figure 6. Create a file with your jobs id’s.
Anexo:

Create a tab separated file
1.Copy the table in an excel file.
2.Delete the columns you don’t need.
3.Copy the columns you need into a decent text editor like, vi, gedit, etc. (remember word is not a text editor).
4.Save the file.
