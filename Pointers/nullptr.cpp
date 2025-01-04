#include<bits/stdc++.h>
using namespace std;
int main()
{
    int *ptr;
    cout<<ptr<<endl; //prints garbage value
    ptr = nullptr;
    cout<<ptr<<endl;    //prints 0

    //We cannot derefrence a nullptr, gives segmentation fault
    //cout<<*ptr<<endl;

    //We can check if ptr is null or not
    if(ptr == nullptr)
        cout<<"ptr is null"<<endl;
    else
        cout<<"ptr is not null"<<endl;


    return 0;
}