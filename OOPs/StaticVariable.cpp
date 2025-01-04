#include<iostream>
using namespace std;

    void func(){
    int x = 2;
    static int y = 2;
    cout<<"X: "<<x<<endl;
    cout<<"Y: "<<y<<endl; //function gets deleted from stack, but static variable remains throughout program

    x++;
    y++;
    }

int main(){
    func();
    func();
    func();
    return 0;
}