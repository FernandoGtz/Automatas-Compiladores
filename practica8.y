%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(const char *s);
int yylex();
%}

%union {
    int entero;
    float decimal;
}

%token <entero> NUM_ENTERO
%token <decimal> NUM_DECIMAL
%token MULT

%%

expresion: NUM_ENTERO MULT NUM_ENTERO {
            printf("Expresion valida: Entero %d * Entero %d\n", $1, $3);
          }
          | NUM_DECIMAL MULT NUM_DECIMAL {
            printf("Expresion valida: Decimal %f * Decimal %f\n", $1, $3);
          }
          | NUM_ENTERO MULT NUM_DECIMAL {
            printf("Expresion valida: Entero %d * Decimal %f\n", $1, $3);
          }
          | NUM_DECIMAL MULT NUM_ENTERO {
            printf("Expresion valida: Decimal %f * Entero %d\n", $1, $3);
          }
          ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error sintactico: %s\n", s);
}

int main() {
    printf("Ingrese una expresion: ");
    yyparse();
    return 0;
}