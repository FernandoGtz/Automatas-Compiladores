%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
extern int yylex();
extern int yyparse();
extern FILE *yyin;
extern char *yytext;
void yyerror(const char *s);
%}

%union {
    char* str;
    int num;
}

%token INSERT INTO VALUES LPAREN RPAREN COMMA SEMICOLON UNKNOWN
%token <str> IDENTIFIER STRING
%token <num> NUMBER

%%

stmt: INSERT INTO IDENTIFIER VALUES LPAREN value_list RPAREN SEMICOLON {
        printf("Sentencia SQL válida: INSERT INTO %s VALUES (...);\n", $3);
        free($3); // Liberar memoria del identificador
    }
    ;

value_list: value_list COMMA value
          | value
          ;

value: STRING {
        printf("  Valor: '%s'\n", $1);
        free($1); // Liberar memoria del string
      }
     | NUMBER {
        printf("  Valor: %d\n", $1);
      }
     ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error de sintaxis cerca de '%s': %s\n", yytext, s);
}

int main(int argc, char *argv[]) {
    if (argc > 1) {
        yyin = fopen(argv[1], "r");
        if (!yyin) {
            perror("Error al abrir el archivo");
            return 1;
        }
    }
    
    printf("Analizando sentencias SQL...\n");
    yyparse();
    
    if (argc > 1) {
        fclose(yyin);
    }
    
    return 0;
}