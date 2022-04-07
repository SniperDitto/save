#include <stdio.h>

void main(){
    
    char *str = "ABCDE";

    int i;

    for(i=4; i>0; i--)
        
        printf("%d", *(str+i));

}