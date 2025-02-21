/* Classic Hello World! */
%option noyywrap
%{
#include<stdio.h>
%}

%%
.	printf("Hello World!");
%%
int main() {
	yylex();
	return 0;
}
