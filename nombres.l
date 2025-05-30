/* Nombres Propios (inician con mayuscula o son todos mayusculas) */
%option noyywrap
%{
#include <stdio.h>
%}

/* Definir la expresión regular para nombres propios */
NAME    [A-Z][a-z]+   

%%

{NAME}   { printf("Nombre propio: %s\n", yytext); }
.|\n     { /* Ignorar cualquier otro carácter */ }

%%

int main() {
    yylex();
    return 0;
}

