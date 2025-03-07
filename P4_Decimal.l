%option noyywrap
%{
	#include<stdio.h>
%}

DIGIT [0-9]
DECIMAL {DIGIT}+"."{DIGIT}+

%%
.        { /* Ignorar otros caracteres */ }
{DECIMAL}  printf("Numero decimal reconocido: %s\n", yytext);

%%
int main()
{
	yylex();
	return 0;
}
