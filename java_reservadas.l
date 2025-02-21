/* Palabras reservadas Java */
%option noyywrap
%{
#include <stdio.h>
%}

CLASS    "class"
PUBLIC   "public"
STATIC   "static"
IF       "if"
ELSE     "else"

%%
{CLASS}   printf("Palabra reservada (class): %s\n", yytext);
{PUBLIC}  printf("Palabra reservada (public): %s\n", yytext);
{STATIC}  printf("Palabra reservada (static): %s\n", yytext);
{IF}      printf("Palabra reservada (if): %s\n", yytext);
{ELSE}    printf("Palabra reservada (else): %s\n", yytext);
.         /* Ignorar cualquier otro carácter */
%%

int main() {
    yylex();
    return 0;
}
