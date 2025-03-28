%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylex();
extern int yyparse();
extern FILE *yyin;
extern char *yytext;

void yyerror(const char *s) {
    fprintf(stderr, "Error de sintaxis: %s\n", s);
    fprintf(stderr, "Error cerca de: '%.20s'\n", yytext);
    exit(1);
}
%}

%union {
    int num;
    char *id;
}

%token IF THEN ELSE ERROR
%token LBRACE RBRACE LPAREN RPAREN SEMICOLON ASSIGN
%token <num> NUMBER
%token <id> IDENTIFIER

%%

program:
    statement
    ;

statement:
    if_statement
    | assignment SEMICOLON
    ;

if_statement:
    IF LPAREN condition RPAREN THEN LBRACE statement RBRACE
    {
        printf("If-then valido encontrado\n");
    }
    | IF LPAREN condition RPAREN THEN LBRACE statement RBRACE ELSE LBRACE statement RBRACE
    {
        printf("If-then-else valido encontrado\n");
    }
    ;

condition:
    expression
    ;

expression:
    IDENTIFIER
    | NUMBER
    ;

assignment:
    IDENTIFIER ASSIGN expression
    ;

%%

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Uso: %s archivo.txt\n", argv[0]);
        return 1;
    }

    yyin = fopen(argv[1], "r");
    if (!yyin) {
        perror("Error al abrir el archivo");
        return 1;
    }

    printf("Analizando: %s\n", argv[1]);
    if (yyparse() == 0) {
        printf("La estructura if-then es correcta.\n");
    }

    fclose(yyin);
    return 0;
}