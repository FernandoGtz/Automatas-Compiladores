/* Cadenas que inician y terminan con 00 */
%option noyywrap
%{
#include <stdio.h>
%}

BINARY  [01]+
MATCH   (00[01]*)|([01]*00)

%%
{MATCH}    printf("Palabra válida: %s\n", yytext);
{BINARY}   /* Ignorar palabras binarias que no cumplen la condición */
.          /* Ignorar cualquier otro carácter */
%%

int main() {
    yylex();
    return 0;
}
