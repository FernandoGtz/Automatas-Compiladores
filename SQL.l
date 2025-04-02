%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "y.tab.h"
void yyerror(const char *s);
%}

%%

"INSERT"     { return INSERT; }
"INTO"       { return INTO; }
"VALUES"     { return VALUES; }
[a-zA-Z_][a-zA-Z0-9_]* { yylval.str = strdup(yytext); return IDENTIFIER; }
"("          { return LPAREN; }
")"          { return RPAREN; }
","          { return COMMA; }
";"          { return SEMICOLON; }  /* Añadido para el punto y coma */
\"[^\"]*\"   { 
               yylval.str = strdup(yytext+1); // Eliminar comillas
               yylval.str[strlen(yylval.str)-1] = '\0';
               return STRING; 
             }
[0-9]+       { yylval.num = atoi(yytext); return NUMBER; }
[ \t\n\r]+   { /* Ignorar espacios y saltos de línea */ }
.            { printf("Caracter desconocido: %s\n", yytext); return UNKNOWN; }  /* Cambiado ERROR por UNKNOWN */

%%

int yywrap() { 
    return 1; 
}