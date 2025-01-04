#include<iostream>
#include<string>
using namespace std;

class Print{
    public:
    void print(int a){
        cout<<"Integer: "<<a<<endl;
    }
    void print(float a){
        cout<<"Float: "<<a<<endl;
    }
    void print(double a) {
        cout << "Double: " << a << endl;
    }
    void print(string a){
        cout<<"String: "<<a<<endl;
    }
};

int main(){
    Print p;

    //we are defining function with same name they just differ by the type of parameter
    p.print(10);
    p.print(10.5);
    p.print("Hello");
    return 0;
}