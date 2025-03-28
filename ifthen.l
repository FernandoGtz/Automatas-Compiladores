%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "y.tab.h"

void yyerror(const char *s);
%}

%%

"if"        { return IF; }
"then"      { return THEN; }
"else"      { return ELSE; }
"{"         { return LBRACE; }
"}"         { return RBRACE; }
"("         { return LPAREN; }
")"         { return RPAREN; }
";"         { return SEMICOLON; }
"="         { return ASSIGN; }
[0-9]+      { yylval.num = atoi(yytext); return NUMBER; }
[a-zA-Z]+   { yylval.id = strdup(yytext); return IDENTIFIER; }
[ \t\n]     ; /* Ignorar espacios en blanco */
.           { yyerror("Carácter inválido"); return ERROR; }

%%

int yywrap() {
    return 1;
}