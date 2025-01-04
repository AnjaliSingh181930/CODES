#include <iostream>
#include <string>
using namespace std;

class Teacher{
    //properties or attributes
    //by default all are private if we don't write public
    private: //access modifier
        double salary;   // here we are implementing data hiding or encapsulation

    public: //access modifier
       
        string name;
        string dept;
        string subject;
        
        //method or member functions
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
    Teacher t1; //constructor is called
    Teacher t2; //constructor is called
    t1.name = "John";
    t1.subject = "C++";
    // t1.salary = 10000; private, then how to initialize it, use a "setter" and define it in public section of the class, 
    // because public section can access private members.
    t1.setsalary(10000);

    cout<<t1.name<<endl;
    cout<<t1.dept<<endl;
    cout<<t1.subject<<endl;
    //cout<<t1.salary<<endl; private, then how to print it, use a "getter" function and define it in public section of the class, 
    // because public section can access private members.

    cout<<t1.getsalary()<<endl;

    return 0;
}