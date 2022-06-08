#include<cstdio>

int main()
{

    int n;
    scanf("%d", &n);
    int arr[n];

    for(int i=0;i<n;i++){
        scanf("%d",&arr[i]);
    }

    int idx=0;
    int min=arr[n-1];
    int temp, minIdx;
    while(idx<n){
        for(int i=idx;i<n;i++){
            if(min>=arr[i]){
                min = arr[i];
                minIdx = i;
            }
        }
        temp = arr[idx];
        arr[idx]=min;
        arr[minIdx]=temp;
        min = arr[n-1];
        idx++;
    }

    for(int i=0;i<n;i++){
        printf("%d ",arr[i]);
    }

    return 0;
}