%option noyywrap
%{
	#include <stdio.h>
%}

%%
[a-zA-Z]+    { printf("Text: %s\n", yytext); }
[0-9]+       { printf("Number: %s\n", yytext); }
[+\-*/]      { printf("Operator: %s\n", yytext); }
[ \t]+       { printf("Whitespace\n"); }  /* Espacios y tabulaciones */
\n           { printf("Newline\n"); }  /* Salto de línea */
.            { printf("Unknown: %s\n", yytext); }
%%

int main() {
	yylex();
	return 0;
}
