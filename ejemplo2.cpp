#include <iostream> // Comentario 1
using namespace std; // Comentario 2

int main() {
    double x = 15.5, y = 7.3, division; // Comentario 3
    bool resultadoLogico;  // Comentario 4

    // Realizando una division
    division = x / y; // Comentario 5
    cout << "Resultado de la division: " << division << endl; // Comentario 6

    // Evaluacion de operadores logicos
    resultadoLogico = (x > y) && (y != 0); // Comentario 7
    cout << "Resultado logico: " << resultadoLogico << endl; // Comentario 8

    return 0; // Comentario 9
}
