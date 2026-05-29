#!/usr/bin/perl

my $header = 0;
my $count = 0;
my $num_subjects = 0;
my @sum;

while (<>) {
    chomp;
    my @fields = split(' ', $_);

    if ($header == 0) {
        $num_subjects = scalar(@fields) - 2;
        for (my $i = 2; $i < scalar(@fields); $i++) {
            printf "\t%s", $fields[$i];
        }
        printf "\t%s\t%s\n", "총점", "평균";
        $header = 1;
        next;
    }

    $count++;
    my $total = 0;
    for (my $i = 2; $i < scalar(@fields); $i++) {
        $total += $fields[$i];
        $sum[$i] += $fields[$i];
    }
    my $avg = $total / $num_subjects;
    printf "%s\t%s", $fields[0], $fields[1];
    for (my $i = 2; $i < scalar(@fields); $i++) {
        printf "\t%d", $fields[$i];
    }
    printf "\t%d\t%.1f\n", $total, $avg;
}

if ($count > 0) {
    printf "(과목평균)";
    for (my $i = 2; $i < scalar(@sum); $i++) {
        printf "\t%.1f", $sum[$i] / $count;
    }
    printf "\n";
}
