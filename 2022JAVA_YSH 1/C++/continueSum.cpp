#include<cstdio>

main()
{

    int n;
    scanf("%d", &n);
    int arr[n];

    for(int i=0;i<n;i++){
        scanf("%d",&arr[i]);
    }

    int sum[n];
    int tempSum=0;
    int cnt=0;
    int idx=0;
    for(int i=0;i<n;i++){
        tempSum = 0;
        if(arr[i]>0){
            cnt++;
            if(cnt==2){
                tempSum += arr[i] + arr[i-1];
            }else if(cnt>2){
                tempSum += arr[i];
            }
            tempSum+=arr[i];
            sum[idx] = tempSum;
            idx++;
        }
    }

    int maxSum = sum[0];
    for(int num:sum){
        if(maxSum<num){
            maxSum=num;
        }
    }

    printf("%d",maxSum);

    return 0;
}