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
            cout<<"Person parameterized constructor is called"<<endl;
            this -> name = name;
            this -> age = age;
        }

        Person(){
            cout<<"Person non-parameterized constructor is called"<<endl;
        }

        //getter function
        void getInfo(){
            cout<<"Name: "<<name<<endl;
            cout<<"Age: "<<age<<endl;
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

        ~Student(){
                cout<<"Student Destructor is called"<<endl;
        }
};

class Teacher : public Person { //Teacher inherit person class in public mode
    //properties or attributes
    public:
        int salary;

        Teacher(string name, int age, int salary) : Person( name, age){ //calling base contructor
            this -> salary = salary;
            cout<<"Teacher constructor is called"<<endl;
        }       

        //getter function
        void getInfo(){
            cout<<"Name: "<<name<<endl;
            cout<<"Age: "<<age<<endl;
            cout<<"Salary: "<<salary<<endl;
        }

        ~Teacher(){
                cout<<"Teacher Destructor is called"<<endl;
        }

};

int main()
{
    Person P1;

    P1.getInfo();

    // at last destructor for child class is called then destrutor for base class is called.

    return 0;
}