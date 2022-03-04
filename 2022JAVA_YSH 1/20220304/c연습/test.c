#include <stdio.h>

int main(void)
{
    printf("hello world!\n");
    printf("%d년 %d월 %d일\n",2022,03,04);

    printf("%%c는 문자 : %c\n",'a');//문자
    printf("%%s는 문자열 : %s\n","안녕하세요");//문자열
    printf("%%f는 소숫점 6자리 고정 : %f\n",0.123456789);//소수점6자리(반올림) 0.123457
    printf("%%o는 8진법 숫자 : %o\n",10);//8진법 숫자 12
    printf("%%x는 16진법 숫자 : %x\n",10);//16진법 숫자 a
    printf("%%u는 10진법 숫자 : %u\n",10);//10진법 숫자 10
    
    
    return 0;
}