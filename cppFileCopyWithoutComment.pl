#!/usr/bin/perl
use strict;
use warnings;

print "Enter the file you wish copied without comments(case sensitive):\n";
chomp(my $inputFile = <>);
open(FHR, '<', "$inputFile") or die "Cant open $inputFile file"; 
print "Enter name of the output file(case sensitive):\n";
chomp(my $outputFile = <>);
open(FHW, '>', "$outputFile") or die "Cant open $outputFile file"; 
my @line;

print("Copying content without comments from $inputFile to $outputFile\n");
while(<FHR>) {
    # check for c++ multiline (/*...*/) comments and replace with ""
    next if (/\/\*/ .. /\*\//);
    # check for c++ single line comments (//) comments, split and pop
    if (m/\/\//) {
        @line = (split /\/\//, $_);
        pop @line;
        $_ = join ( "", (@line));
        print FHW $_ , "\n";
    } else {
        print FHW $_;
    }
}
close(FHR);
close(FHW);

print "File content copied and comments removed successfully!", "\n";
