#include <stdio.h>
using namespace std;

int main()
{
    int N,X;
    scanf("%d %d", &N, &X);
    for(int i=0;i<N;i++){
        int A;
        scanf("%d", &A);
        if(X>A) printf("%d ",A);
    }

    return 0;
}