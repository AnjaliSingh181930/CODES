#include <iostream>
using namespace std;

class Inc {
public:
    int x;               // Non-static member (unique to each object)
    static int y;        // Static member (shared among all objects)

    void Incxy() {
        x++;             // Increment the non-static member
        y++;             // Increment the static member
    }
};

// Definition of the static variable outside the class
int Inc::y = 0;

int main() {
    Inc i, j;

    // Set individual values for x
    i.x = 10;
    j.x = 5;

    // Set a value for the shared static member y
    Inc::y = 20;

    i.Incxy(); // Increment i.x and shared y
    cout << "i.x: " << i.x << endl;       // i.x = 11
    cout << "Inc::y: " << Inc::y << endl; // Inc::y = 21 (shared)

    j.Incxy(); // Increment j.x and shared y
    cout << "j.x: " << j.x << endl;       // j.x = 6
    cout << "Inc::y: " << Inc::y << endl; // Inc::y = 22 (shared)

    return 0;
}
