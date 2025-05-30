/* Enteros y Decimales sin signo */ 
%option noyywrap
%option noyywrap
%{
#include <stdio.h>
%}

DIGIT     [0-9]
INTEGER   {DIGIT}+
DECIMAL   {DIGIT}+"."{DIGIT}+
NEGATIVE  -{DIGIT}+(\.{DIGIT}+)?

%%
{NEGATIVE} /* Ignorar n�meros negativos */
{DECIMAL}  printf("Numero decimal sin signo: %s\n", yytext);
{INTEGER}  printf("Numero entero sin signo: %s\n", yytext);
.          /* Ignorar cualquier otro car�cter */
%%

int main() {
    yylex();
    return 0;
}
