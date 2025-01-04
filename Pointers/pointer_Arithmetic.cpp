#include<bits/stdc++.h>
using namespace std;
int main()
{
    int a=10;
    int *ptr=&a;
    cout<<"Value of pointer:  "<<ptr<<endl;
    cout<<"Value of variable pointed by pointer:  "<<*ptr<<endl;

    cout<<"Increment/ Decrement Pointer"<<endl;
    ptr++; //increased by the size of value pointed by it
    cout<<"Value of pointer after doing ptr++:  "<<ptr<<endl;
    cout<<"Value of variable pointed by pointer after doing ptr++:  "<<*ptr<<endl;

    cout<<"Add/ Subtract integer from Pointer"<<endl;
    cout<<"ptr + 3: "<<ptr + 3 <<endl; //Increase by 3 * size of value pointed by it
    cout<<"ptr - 3: "<<ptr - 3 <<endl; //Decrease by 3

    cout<<"Subtract two ptr"<<endl;
    int *ptr1 =  ptr + 2;
    cout<<"ptr1 - ptr: "<<ptr1 - ptr <<endl; //Can be done for only same type of pointer.

    cout<<"Add two ptr is not allowed"<<endl;

    cout<<"Comparing two ptr "<<endl;
    cout<<"ptr: "<<ptr<<endl; 
    cout<<"ptr1: "<<ptr1<<endl;
    cout << "ptr == ptr1: " << (ptr == ptr1) << endl;
    cout << "ptr != ptr1: " << (ptr != ptr1) << endl;
    cout << "ptr > ptr1: " << (ptr > ptr1) << endl;
    cout << "ptr < ptr1: " << (ptr < ptr1) << endl;
    cout << "ptr >= ptr1: " << (ptr >= ptr1) << endl;
    cout << "ptr <= ptr1: " << (ptr <= ptr1) << endl;




    return 0;
}