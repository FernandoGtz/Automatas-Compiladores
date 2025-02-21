%option noyywrap
%{
#include <stdio.h>
%}

ALPHA  [a-z]+
MATCH  ([a-z]*ae[a-z]*)|([a-z]*ai[a-z]*)|([a-z]*ao[a-z]*)|([a-z]*au[a-z]*)

%%
{MATCH}    printf("Palabra encontrada: %s\n", yytext);
{ALPHA}    /* Ignorar palabras que no cumplen el patrón */
.          /* Ignorar cualquier otro caracter */
%%

int main() {
    yylex();
    return 0;
}
