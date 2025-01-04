#include<bits/stdc++.h>
using namespace std;

int main(){
    int arr[5] = {1,2,3,4,5};
    int *ptr = arr;
    cout<<"Value of arr can never be changed as it is of type constant pointer"<<endl;
    cout<<"Array elements accessed through ptr[i](ptr[i] is shorthand for *(ptr + i)) are: "<<endl;
    for(int i=0;i<5;i++){
        cout<<ptr[i]<<" "; //ptr[i] is shorthand for *(ptr + i)
    }
    cout<<endl<<"Array elements accessed through *arr + i are: "<<endl;;
    for(int i=0;i<5;i++){    
        cout<<*arr + i<<" ";
    }
    cout<<endl<<"Array elements accessed through *(arr+i) are: "<<endl;
    for(int i=0;i<5;i++){    
        cout<<*(arr+i)<<" ";
    }
    cout<<endl<<"Array elements accessed through *(ptr+i) are: "<<endl;
    for(int i=0;i<5;i++){    
        cout<<*(ptr+i)<<" ";
    }
    cout<<endl;
    return 0;
}