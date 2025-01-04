#include <iostream>
using namespace std;

class Counter {
public:
    Counter() {
        count = 0;
        cout << "Counter object created." << endl;
    }

    ~Counter() {
        cout << "Counter object destroyed." << endl;
    }

    void increment() {
        count++;
    }

    void display() {
        cout << "Count: " << count << endl;
    }

private:
    int count;
};

// Function using a static object
void staticObjectExample() {
    static Counter counter; // Static object: created only once and persists across function calls
    //Counter counter;
    counter.increment();
    counter.display();
}

int main() {
    cout << "Calling function first time:" << endl;
    staticObjectExample(); // Static object is created and used
    // static Counter counter1;
    // counter1.increment();
    // counter1.display();

    cout << "\nCalling function second time:" << endl;
    staticObjectExample(); // Static object is reused (not recreated)
    // static Counter counter2;
    // counter2.increment();
    // counter2.display();

    cout << "\nCalling function third time:" << endl;
    staticObjectExample(); // Static object retains its state

    return 0;
}
