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
	chomp $line;
	my @st=split(/\t/,$line);
	print("svr_retrieve_RAST_job  $user $password $st[0] amino_acid > $st[1].faa\n");
	system("svr_retrieve_RAST_job $user $password $st[0] amino_acid > $st[1].faa");
	print("svr_retrieve_RAST_job  $user $password $st[0] table_txt > $st[1].txt\n");
	system("svr_retrieve_RAST_job $user $password $st[0] table_txt > $st[1].txt");
	print("svr_retrieve_RAST_job  $user $password $st[0] nucleic_acid > $st[1].fna\n");
	system("svr_retrieve_RAST_job $user $password $st[0] nucleic_acid > $st[1].fna");	
}


