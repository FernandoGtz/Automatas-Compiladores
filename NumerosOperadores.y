%{
#include<stdio.h>
int yylex(void);
int yywrap();
int yyerror(char* s);
%}

%start program
%union { int inum; }
%token NUMERO 
%token OPERADOR

%%
program: NUMERO OPERADOR NUMERO {
        printf("Se procesa la entrada \"OPERACION\" y es correcta de acuerdo con las reglas.\n");
};
%%

int main() {
    printf("beginning\n");
    int res = yyparse();
    printf("ending, %d\n", res);
    return(res);
}