#include<iostream>
#include<string>
using namespace std;

int main()
{
    int n;
    string str;
    while(!cin.eof()){
        cin >> n;
        cin.ignore();
        getline(cin, str);
    }
    
    return 0;
}