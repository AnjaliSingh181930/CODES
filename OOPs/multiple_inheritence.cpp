#include <iostream>
#include <string>
using namespace std;


class Student { //Student inherit person class in public mode
    //properties or attributes
    public:
        int rollNo;
        string name;

        Student(string name,int rollNo){ 
            this -> rollNo = rollNo;
            this -> name = name;
            cout<<"Student constructor is called"<<endl;
        }

        //getter function
        void getInfo(){
            cout<<"Name: "<<name<<endl;
            cout<<"RollNo: "<<rollNo<<endl;
        }

        ~Student(){
                cout<<"Student Destructor is called"<<endl;
        }
};

class Teacher{ //Teacher inherit person class in public mode
    //properties or attributes
    public:
        int salary;
        string subject;

        Teacher(string subject, int salary){ 
            this -> salary = salary;
            this -> subject = subject;
            cout<<"Teacher constructor is called"<<endl;
        }       

        //getter function
        void getInfo(){
            cout<<"Subject: "<<subject<<endl;
            cout<<"Salary: "<<salary<<endl;
        }

        ~Teacher(){
                cout<<"Teacher Destructor is called"<<endl;
        }

};

class TA : public Student, public Teacher { //TA inherit student and teacher class in public mode
    //properties or attributes
    public:
        string specialization;        

        TA(string name, int rollNo, int salary, string subject , string specialization) : Student(name, rollNo), Teacher(subject, salary){ //calling base contructor
            this -> specialization = specialization;
            cout<<"TA constructor is called"<<endl;
        }       
        
        //getter function
        void getInfo(){
            cout<<"Name: "<<name<<endl;
            cout<<"RollNo: "<<rollNo<<endl;
            cout<<"Salary: "<<salary<<endl;
            cout<<"Subject: "<<subject<<endl;
            cout<<"Specialization: "<<specialization<<endl;
        }   

        ~TA(){
                cout<<"TA Destructor is called"<<endl;
        }           

};
int main()
{
    TA T1("Anjali", 24, 12450,"C++", "Cyber Security"); //when object for student class is created ,constructor for base class is called then construtor for child class is called

    T1.getInfo();

    // at last destructor for child class is called then destrutor for base class is called.

    return 0;
}