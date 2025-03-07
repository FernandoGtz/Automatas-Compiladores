%option noyywrap
%{
	#include<stdio.h>
%}

RFC_F [A-ZÑ&]{4}[0-9]{6}[A-Z0-9]{3}    
RFC_M [A-ZÑ&]{3}[0-9]{6}[A-Z0-9]{3}    

%%
{RFC_F} { printf("RFC de persona fisica valido: %s\n", yytext); }
{RFC_M} { printf("RFC de persona moral valido: %s\n", yytext); }
.        { /* Ignorar otros caracteres */ }

%%
int main()
{
	yylex();
	return 0;
}
