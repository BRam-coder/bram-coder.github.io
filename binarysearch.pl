#!/usr/bin/perl
use strict;

# get values;
print "Enter each integer followed by a comma for each subsequent entry:\n";
chomp (my $num = <>);

# convert text to array then to integer array and quicksort(ascending);
my @sorted_array = sort { $a <=> $b } my @array = split /,/, $num;

# get search value;
print "\nEnter the integer you are searching for:\n";
chomp (my $search = int (<>));

# Initialize 
my $left_bound = 0;
my $right_bound = scalar @sorted_array;
my $found = 0;

# Search algorithm
while ($left_bound <= $right_bound && $found != 1) {
    my $middle = int (($left_bound + $right_bound)/2);
    if (@sorted_array[$middle] == $search) {
        $found = 1;
    } elsif ( @sorted_array[$middle] > $search) {
        $right_bound = $middle - 1;
    } else {
        $left_bound = $middle + 1;
    }
}

print my $result =  ($found == 1) ? "$search is in the array" : "Could not find: $search" , "\n"; 
