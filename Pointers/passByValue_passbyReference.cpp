#include<bits/stdc++.h>
using namespace std;

void changeA(int a){
    a = 20;
    cout<<"Value of a when we pass by value in function "<<a<<endl;
}

void changeA(int *ptr){
    *ptr = 20;
    cout<<"Value of a when we pass by reference in function "<<*ptr<<endl;
}

void changeB(int &b){
    b = 20;
    cout<<"Value of a when we pass by reference in function "<<b<<endl;
}

int main()
{
    cout<<"1. Pass by value , 2. Pass by reference. "<<"\n"<<"Chooose one: ";
    int choice;
    cin>>choice;

    int a = 10;
    int b = 10;
    if(choice == 1){
        changeA(a);
        cout<<"Value of a when we pass by value in main function "<<a<<endl;
    }
    
    if(choice == 2){
        cout<<"Ways of passing by reference: "<<endl<<"1. Pass by reference using pointer(&a) "<<endl;
        changeA(&a);
        cout<<"Value of a when we pass by reference in main function "<<a<<endl;
        cout<<"2. Pass by reference using alias(b), A reference (alias) to the variable is passed, and modifications inside the function directly affect the original variable."<<endl;
        changeB(b);
        cout<<"Value of b when we pass by reference in main function "<<b<<endl;
    }


    
    return 0;
}