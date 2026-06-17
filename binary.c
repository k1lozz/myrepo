void binary(int value) {
    if (value == 0) {
        printf("0");
        return;
    }
    
    int bin[32];
    int i = 0;
    
    while (value > 0) {
        bin[i] = value % 2;
        value = value / 2;
        i++;
    }
    
    for (int j = i - 1; j >= 0; j--) {
        printf("%d", bin[j]);
    }
}
