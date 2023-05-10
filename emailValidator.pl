#!/usr/bin/perl
use strict;
use warnings;

print "Enter the file you wish check:\n";
chomp(my $inputFile = <>);

open(FHR, '<', "$inputFile") or die "Cant open $inputFile file"; 

while(<FHR>) {
    # this regex alows: "uS3r.Nam3@domain.ENDINGWITH(com | edu | org | gov | net)"
    print unless ($_ =~ /^[A-Za-z0-9]([A-Za-z0-9.]+[A-Za-z0-9])?\@([a-z0-9.]+[com | edu | org | gov | net-])+$/);
}
