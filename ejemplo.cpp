#include <iostream>
using namespace std;

// Este es un comentario de una linea
/* Este es un comentario
   de multiples lineas */

int main() {
    int a = 10;
    float b = 5.5;
    char c = 'X';

    if (a > b && c != 'Y') {
        cout << "Condicion verdadera" << endl;
    } else {
        cout << "Condicion falsa" << endl;
    }

    a = a + b * 2;
    cout << "Resultado: " << a << endl;

    return 0; // Fin del programa
}
