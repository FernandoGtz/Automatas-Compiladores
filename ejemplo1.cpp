#include <iostream>  // Comentario 1
using namespace std; // Comentario 2

int main() {
    int a = 5, b = 10, resultado;  // Comentario 3
    bool esMayor; // Comentario 4

    // Suma de a y b
    resultado = a + b;  // Comentario 5
    cout << "Resultado de la suma: " << resultado << endl;  // Comentario 6

    // Operador logico AND
    esMayor = (a < b) && (b > 5); // Comentario 7
    cout << "Es mayor: " << esMayor << endl;  // Comentario 8

    // Operador logico OR
    esMayor = (a > 10) || (b < 15); // Comentario 9
    cout << "Es mayor: " << esMayor << endl;  // Comentario 10

    return 0;  // Comentario 11
}
