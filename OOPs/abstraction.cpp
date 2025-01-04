#include<iostream>
#include<string>
using namespace std;    

class Shape{
    virtual void draw() = 0;
};

class Rectangle: public Shape{
    public:
    void draw(){
        cout<<"Drawing Rectangle"<<endl;
    }
};  

class Circle: public Shape{
    public:
    void draw(){
        cout<<"Drawing Circle"<<endl;
    }
};  

int main(){
    Rectangle r;
    r.draw();
    Circle c;
    c.draw();
    return 0;
}