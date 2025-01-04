#include <iostream>
#include <string>
using namespace std;

class Teacher{
    //properties or attributes
    //by default all are private if we don't write public
    private: //access modifier
        double salary;   // here we are implementing data hiding or encapsulation

    public: //access modifier

        //constructor , no return type, called when object created
        /* 
        // Non-parameterized constructor
        Teacher(){ 
            //Let us say we want to set some values while object creation for all objects, we can do that here.
            dept = "CSE"; //like if class is for CSE dept teachers dept will always be CSE.
            salary = 0;  //default salary
            cout<<"Teacher constructor is created"<<endl;
        }
        */ 

       // Parameterized constructor 
    //    Teacher(string n, string d, string sub, double s){
    //         //Let us say we want to set some values while object creation ,we can pass them at that time only, 
    //         //no need to write separately .
    //         name = n;
    //         dept = d;
    //         subject = sub;
    //         salary = s;
    //    }

       //Parameterized Constructor 
       Teacher(string name, string dept, string subject, double salary){
            //Let us say we want to set some values while object creation ,we can pass them at that time only, 
            //no need to write separately .
            //Also we want to keep name of constructor parameters same as name of object properties, then we 
            //can show using this keyword whichone is object property and whichone is constructor parameter 
            this->name = name; //left is object name, right is parameter name.....
            this -> dept = dept; //left is object name, right is parameter name.....
            this -> subject = subject;
            this -> salary = salary;
       }

    // Copy Constructor
        Teacher(Teacher &t){ //passed by reference,because copy constructor must pass its first argument by reference ,although here we dont want to pass by reference, we want to copy the values of t to this object
            this -> name = t.name;
            this -> dept = t.dept;
            this -> subject = t.subject;
            this -> salary = t.salary;
        }
       
        string name;
        string dept;
        string subject;

        //method or member functions

        void getinfo(){
            cout<<name<<endl;
            cout<<dept<<endl;
            cout<<subject<<endl;
            cout<<salary<<endl<<endl;

        }

        void changeDept(string newDept){
            dept = newDept;
        }

        //setter function   
        void setsalary(double newSalary){
            salary = newSalary;
        }

        //getter function
        double getsalary(){
            return salary;
        }
    
};

class Students{
    //properties or attributes
    public:
    string name;
    string dept;
    string entryNo;
};

int main()
{
    Teacher t1("John", "CSE", "C++", 10000); //constructor is called
    Teacher t2(t1); //default copy constructor is called if we dont create a custom copy constructor
    
    t1.getinfo();
    t2.getinfo();

    return 0;
}