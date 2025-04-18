%{
#include "y.tab.h"  // Para usar los tokens definidos en Yacc
%}

%%
[0-9]+          { yylval.entero = atoi(yytext); return NUM_ENTERO; }
[0-9]+"."[0-9]+ { yylval.decimal = atof(yytext); return NUM_DECIMAL; }
"*"             { return MULT; }
[ \t\n]         ;  // Ignorar espacios, tabs y saltos de l�nea
.               { printf("Error: Car�cter no v�lido '%s'\n", yytext); }
%%

int yywrap() { return 1; }