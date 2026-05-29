BEGIN {
    header = 0
    count = 0
}
header == 0 {
    num_subjects = NF - 2
    for (i = 3; i <= NF; i++) {
        printf "\t%s", $i
    }
    printf "\t%s\t%s\n", "총점", "평균"
    header = 1
    next
}
{
    count++
    total = 0
    for (i = 3; i <= NF; i++) {
        total += $i
        sum[i] += $i
    }
    avg = total / num_subjects
    printf "%s\t%s", $1, $2
    for (i = 3; i <= NF; i++) {
        printf "\t%d", $i
    }
    printf "\t%d\t%.1f\n", total, avg
}
END {
    if (count > 0) {
        printf "(과목평균)"
        for (i = 3; i <= NF; i++) {
            printf "\t%.1f", sum[i] / count
        }
        printf "\n"
    }
}
