#!/usr/bin/perl
use strict;
use warnings;

##########################
##file must contain only rast genome ids example###
#6666666.123456
#6666666.391826
#
#
my $file=shift @ARGV;
my $user=shift @ARGV;
my $password=shift @ARGV;

open (FILE,$file) or die "No pude abrir el archivo $file\n$!";
foreach my $line (<FILE>){
	chomp $line
	print("svr_retrieve_RAST_job  $user $password $line amino_acid > $line.faa");
	system("svr_retrieve_RAST_job $user $password $line amino_acid > $line.faa");
	print("svr_retrieve_RAST_job  $user $password $line table_txt > $line.txt");
	system("svr_retrieve_RAST_job $user $password $line table_txt > $line.txt");
	print("svr_retrieve_RAST_job  $user $password $line nucleic_acid > $line.fna");
	system("svr_retrieve_RAST_job $user $password $line nucleic_acid > $line.fna");	
}


