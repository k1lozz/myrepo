#include <stdio.h>
#include <stdlib.h>
#include <unistd.h> 
#include "binary.h" 

int main(int argc, char *argv[]) {
    int opt;
    int flag_x = 0; 
    int flag_o = 0; 
    int flag_b = 0; 

        while ((opt = getopt(argc, argv, "xob")) != -1) {
        switch (opt) {
            case 'x': flag_x = 1; break;
            case 'o': flag_o = 1; break;
            case 'b': flag_b = 1; break;
            default:
                fprintf(stderr, "Usage: %s [-x] [-o] [-b] number1 [number2 ...]\n", argv[0]);
                exit(1);
        }
    }

       for (int i = optind; i < argc; i++) {
        int num = atoi(argv[i]); 
        
        printf("=== Number: %d ===\n", num);
        
        if (flag_x) {
            printf("16: %X\n", num); 
        }
        if (flag_o) {
            printf("8: %o\n", num);  
        }
        if (flag_b) {
            printf("2: ");
            binary(num);               
            printf("\n");
        }
        printf("\n");
    }

    return 0;
}
