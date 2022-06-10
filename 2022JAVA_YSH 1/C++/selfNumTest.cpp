#include <stdio.h>

int main() {
 
  int number;
  scanf("%d",&number);
  int div = 10;
  int result = 0;
 
  while (number > 0) {
  
    result = result * div;
    result = result + number % div;
    number = number / div;
  
  }
 
  printf("%d", result);
 
}
