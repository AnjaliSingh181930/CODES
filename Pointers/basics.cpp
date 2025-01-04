#include<bits/stdc++.h>
using namespace std;
int main(){

    int n = 3;
    int *p = &n;
    int **pp = &p;

    cout<<"\n"<<"n is a integer variable and p is a pointer variable, pointing n: "<<endl;
    cout<<"n: "<<n<<endl;
    cout<<"&n: "<<&n<<endl; // & is address of operator
    cout<<"p: "<<p<<endl;
    cout<<"&p: "<<&p<<endl;
    cout<<"*p: "<<*p<<endl; //* is dereference operator
    cout<<"pp: "<<pp<<endl;
    cout<<"&pp: "<<&pp<<endl;
    cout<<"*pp: "<<*pp<<endl;
    cout<<"**pp: "<<**pp<<endl;
    cout<<"*(&n): "<<*(&n)<<endl;
    cout<<"&(*p): "<<&(*p)<<endl;
    
    float price = 100.5f;
    float* p2 = &price;
    cout<<"\n"<<"price is a float variable and p2 is a pointer variable, pointing price: "<<endl;
    cout<<"&price: "<<&price<<endl;
    cout<<"p2: "<<p2<<endl;
    cout<<"&p2: "<<&p2<<endl;
    cout<<"*p2: "<<*p2<<endl;

    cout<<"\n"<<"Fetching address of an integer array: "<<endl;
    vector<int> v(n);
    for(int i=0; i<n; i++){
        v[i] = i+3 % 2;
    }
    vector<int*> pv(n);
    for(int i=0; i<n; i++){
        pv[i] = &v[i];
        cout<<pv[i]<<endl;
    }


    return 0;
}