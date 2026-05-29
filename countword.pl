#!/usr/bin/perl

my %count;

while (<>) {
    chomp;
    $count{$_}++;
}

foreach my $word (keys %count) {
    printf "%s %d\n", $word, $count{$word};
}
