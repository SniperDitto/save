#include<cstdio>
#include<string>
using namespace std;

int main()
{

    int inNum;
    string strSize;
    scanf("%d",&inNum);
    strSize = to_string(inNum).size();
    int nextNum;

    if(){
        printf("1의자리 : %d",inNum%10);
    }else if(){
        printf("10의자리 : %d",inNum/10);
        printf("1의자리 : %d",inNum%10);
    }else if(inNum<100){

    }
    

    return 0;
}
