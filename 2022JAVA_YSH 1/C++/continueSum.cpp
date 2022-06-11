#include<cstdio>

int main()
{

    int n;
    scanf("%d", &n);
    int arr[n];

    for(int i=0;i<n;i++){
        scanf("%d",&arr[i]);
    }

    int maxSum[n];
    int tempSum=0;
    maxSum[0] = arr[0];
    int max = arr[0];
    int index=0;
    int *left = arr;
    int *right = arr;
    while(left < &arr[n])
    {
        tempSum+=*right;
        if(tempSum<0){
            right++;
            left=right;
            if(*left==arr[n]) break;
            tempSum=0;
        }else{
            maxSum[index]=tempSum;
            index++;
            right++;
            if(max<tempSum){
                max=tempSum;
            }
        }
        
    }

    printf("%d",max);

    return 0;
}
//https://www.acmicpc.net/problem/1912