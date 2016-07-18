# myrast
myrast dockerfile 

`docker run -i -t -v /home/nelly/docker-myrast:/home myrast /bin/bash`

Download files
`svr_retrieve_RAST_job <user> <password> <jobId> table_txt > $ID.txt`


### Rast formats to retrieve files.
You can change the format table_txt line 46 Figure 7 for whatever format you need.  


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
