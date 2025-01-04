#include <iostream>
#include <string>
using namespace std;

class Person{
    //properties or attributes
    public:
        //statically allocated memory
        string name;
        int age; 

        Person(string name, int age){
            cout<<"Person constructor is called"<<endl;
            this -> name = name;
            this -> age = age;
        }

        //getter function
        void getInfo(){
            cout<<"Name: "<<name<<endl;
            cout<<"Age: "<<age<<endl;
        }

        //virtual function
        virtual void Hello(){
            cout<<"Hello from parent"<<endl;
        }

        ~Person(){
            cout<<"Person Destructor is called"<<endl;
        }

};

class Student : public Person { //Student inherit person class in public mode
    //properties or attributes
    public:
        int rollNo;

        Student(string name, int age, int rollNo) : Person( name, age){ //calling base contructor
            this -> rollNo = rollNo;
            cout<<"Student constructor is called"<<endl;
        }

        //getter function
        void getInfo(){
            cout<<"Name: "<<name<<endl;
            cout<<"Age: "<<age<<endl;
            cout<<"RollNo: "<<rollNo<<endl;
        }

        void Hello(){
            cout<<"Hello from child"<<endl;
        }

        ~Student(){
                cout<<"Student Destructor is called"<<endl;
        }
};


int main()
{
    Student S1("Anjali", 24, 1); //when object for student class is created ,constructor for base class is called then construtor for child class is called

    //both student and teacher have getInfo but Students getInfo gets executed
    S1.getInfo();

    // at last destructor for child class is called then destrutor for base class is called.

    return 0;
}