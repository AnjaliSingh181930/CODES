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

        Student(string name, double cgpa){
            this -> name = name;
            this -> cgpaPtr = new double ; //this memory is in heap   
            *cgpaPtr = cgpa;
        }

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
};

int main()
{
    Student S1("Anjali", 9.5);
    S1.getInfo();
    Student S2(S1); //default copy constructor called.

    S2.name = "Pankaj";
    *(S2.cgpaPtr) = 8.5;

    S1.getInfo(); //cgpa of S1 is also changed as it is passed by reference, coz its  shallow copy, because both S1 cgpaPtr and 
    //S2 cgpaPtr point to same memory location, default constructor also causes same issue. 
    
    S2.getInfo();

    return 0;
}