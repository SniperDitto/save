#include <cstdio>
#include <iostream>
#include <cmath>
using namespace std;

int main()
{
    int i;
    while ((scanf("%d\n", &i) != EOF))
    {
        long chkNum = 0;
        int digits = 0;
        while(true)
        {
            chkNum = chkNum*10 + 1;
            chkNum %= i;
            digits++;
            if(chkNum%i==0){
                printf("%d\n",digits);
                break;
            }
        }
    }

    return 0;
}

