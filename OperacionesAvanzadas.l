%{
#include <math.h>
#include <string.h>
#include "y.tab.h"
void agregar_texto(const char *);
%}

%%

[ \t]       ; /* Ignorar espacios en blanco */
\n          { agregar_texto(yytext); return NL; }
"+"         { agregar_texto(yytext); return MAS; }
"-"         { agregar_texto(yytext); return MENOS; }
"*"         { agregar_texto(yytext); return POR; }
"/"         { agregar_texto(yytext); return DIVIDIDO; }
"%"         { agregar_texto(yytext); return MODULO; }
"^"         { agregar_texto(yytext); return POTENCIA; }
"("         { agregar_texto(yytext); return PARENTESIS_IZQ; }
")"         { agregar_texto(yytext); return PARENTESIS_DER; }
"sin"       { agregar_texto(yytext); return SIN; }
"cos"       { agregar_texto(yytext); return COS; }
"tan"       { agregar_texto(yytext); return TAN; }
[0-9]+      { agregar_texto(yytext); yylval.numero = atof(yytext); return NUMERO; }
[0-9]+\.[0-9]+ { agregar_texto(yytext); yylval.numero = atof(yytext); return NUMERO; }
.           { printf("Carácter no reconocido: %s\n", yytext); }

%%

char texto_operacion[256] = {0};

void agregar_texto(const char *s) {
    strcat(texto_operacion, s);
}

int yywrap() {
    return 1;
}