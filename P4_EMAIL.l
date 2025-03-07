%option noyywrap
%{
	#include<stdio.h>
%}

EMAIL [a-zA-Z]{2}[0-9]{6}@uaeh\.edu\.mx   
RFC_M [A-ZÑ&]{3}[0-9]{6}[A-Z0-9]{3}    

%%
{EMAIL} { printf("Correo institucional valido: %s\n", yytext); } 
.        { /* Ignorar otros caracteres */ }

%%
int main()
{
	yylex();
	return 0;
}
