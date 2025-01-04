#include <iostream>
#include <string>
using namespace std;

class Student{
    //properties or attributes
    public:
        //statically allocated memory
        string name;
        //dynamically allocated memory
        double *cgpaPtr; 

        //parameterized constructor
        Student(string name, double cgpa){
            this -> name = name;
            this -> cgpaPtr = new double ; //this memory is in heap   
            *cgpaPtr = cgpa;
        }

        //copy constructor
        Student(Student &s){
            this -> name = s.name;  
            //this -> cgpaPtr = s.cgpaPtr; //passed by reference,because copy constructor must pass its first argument by reference ,
            //although here we dont want to pass by reference, we want to copy the values of s to this object
            this -> cgpaPtr = new double;
            *cgpaPtr = *(s.cgpaPtr);
        }

        void getInfo(){
            cout<<"Name: "<<name<<endl;
            cout<<"Cgpa: "<<*cgpaPtr<<endl;
        }

        //destructor
        ~Student(){
            cout<<"Destructor called"<<endl;
            delete cgpaPtr; //deletes the memory pointed by the cgpaPtr, if we don't do this problems like memory leak will occur
        }
};

/*************  ✨ Codeium Command ⭐  *************/
/******  459cefcc-80df-4d72-8da7-5024e3171ef2  *******/
int main()
{
    Student S1("Anjali", 9.5);
    S1.getInfo();

    return 0;
}