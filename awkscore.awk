BEGIN {
    printf "%s\t%s\t%s\t%s\t%s\t%s\t%s\n", \
    "학번", "이름", "국어", "영어", "수학", "총점", "평균"
}
NR > 1 {
    count++
    kor += $3; eng += $4; math += $5
    total = $3 + $4 + $5
    avg = total / 3
    printf "%s\t%s\t%d\t%d\t%d\t%d\t%.1f\n", \
    $1, $2, $3, $4, $5, total, avg
}
END {
    if (count > 0) {
        kor /= count; eng /= count; math /= count
        printf "%s\t\t%.1f\t%.1f\t%.1f\n", \
        "(과목평균)", kor, eng, math
    }
}
