%{
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>

void yyerror(const char *s);
int yylex(void);
extern char texto_operacion[256];

%}

%union {
    double numero;
}

%token NL
%token <numero> NUMERO
%token MAS MENOS POR DIVIDIDO MODULO POTENCIA
%token PARENTESIS_IZQ PARENTESIS_DER
%token SIN COS TAN

%type <numero> expresion termino factor exponente trigonometria

%left MAS MENOS
%left POR DIVIDIDO MODULO
%right POTENCIA
%left UNARY

%%

inicio:
    inicio expresion NL { 
        printf("Operacion: %s", texto_operacion); 
        printf("Resultado: %g\n", $2); 
        texto_operacion[0] = '\0'; 
    }
    | /* vacío */
    ;

expresion:
    expresion MAS termino { $$ = $1 + $3; }
    | expresion MENOS termino { $$ = $1 - $3; }
    | termino { $$ = $1; }
    ;

termino:
    termino POR factor { $$ = $1 * $3; }
    | termino DIVIDIDO factor { $$ = $1 / $3; }
    | termino MODULO factor { $$ = fmod($1, $3); }
    | factor { $$ = $1; }
    ;

factor:
    exponente { $$ = $1; }
    | trigonometria { $$ = $1; }
    ;

exponente:
    NUMERO POTENCIA exponente { $$ = pow($1, $3); }
    | PARENTESIS_IZQ expresion PARENTESIS_DER { $$ = $2; }
    | NUMERO { $$ = $1; }
    ;

trigonometria:
    SIN PARENTESIS_IZQ expresion PARENTESIS_DER { $$ = sin($3); }
    | COS PARENTESIS_IZQ expresion PARENTESIS_DER { $$ = cos($3); }
    | TAN PARENTESIS_IZQ expresion PARENTESIS_DER { $$ = tan($3); }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
    texto_operacion[0] = '\0';
}

int main() {
    printf("Calculadora Avanzada\n");
    printf("Ingresa operacion: \n");
    yyparse();
    return 0;
}