#-------------------------------------------------------------------------------
# (CS 480-01) (FA18) MOBILE DIGITAL FORENSICS
#                Project 2
#               Submitted By
#           Ashok Kumar Shrestha
#
# Description:
# ============
# Perl script to parse out .JJI (Josh Jones Image) Files from the data files.
#--------------------------------------------------------------------------------

#!/usr/bin/perl
use strict;
use warnings;

#path to input file (raw or dd)
#my $infile = '../../jji_project.dd';
my $infile = '../../sheep.dd';
my $outfile = 'result.txt';

main();

sub main{
	print "----------------------------------------------------------------------------\n";
	
	print("Start processing...\n");

	open(my $infiles, "<:encoding(UNICODE)", $infile) or die "Could not open file '$infile' $!";
	#open(my $infiles, $infile) or die "Could not open file '$infile' $!";
	open(my $file, '>', $outfile) or die "Could not open file '$outfile' $!";

	my $cnt = 0;
	
	#my $regex_pat = '( J O S H.* J O N E S)\b';
	#my $regex_pat = '(JOSH(\s|[^(JONES)])*JONES)\b';
	#my $regex_pat = '(J.?O.?S.?H.?(\s|.)*).?J.?O.?N.?E.?S';
	#my $regex_pat = '(J.?O.?S.?H.?(\s|.)*)';
	#my $regex_pat = '((\p{L}|\p{M}|\p{Z}|\p{S}|\p{N}|\p{P}|\p{C}|\p{Cn}|\p{Sc}|\p{InBlock})*)';
	my $regex_pat = '(J.?O.?S.?H.?(\s|[\s\S])*J.?O.?N.?E.?S.?)\b';


	while(<$infiles>){
		if(/$regex_pat/gimu){
			print($file "[$1]\n");
			$cnt += 1;
		}
	}
	
	close($file) or die "Could not close file: $outfile.";
	close($infiles) or die "Could not close file: $infile.";

	print("No. of matches: $cnt\n");

	print "----------------------------------------------------------------------------\n";
}