%{
#include <stdio.h>
int comment_count = 0;
%}

%%
if|else|while|for|return|int|float|char|void      { printf("Palabra reservada: %s\n", yytext); }
"//".*             { printf("Comentario encontrado: %s\n", yytext); comment_count++; }
"/*"([^*]|"*"+[^*/])*"*/" { printf("Comentario encontrado: %s\n", yytext); comment_count++; }
cout<<.*<<endl;              { printf("Texto impreso: %s\n", yytext); }
[a-zA-Z_][a-zA-Z0-9_]*     { printf("Identificador: %s\n", yytext); }
[+\-*/%]                   { printf("Operador aritmetico: %s\n", yytext); }
&&|\|\||!                  { printf("Operador logico: %s\n", yytext); }
[ \t\n]                     { /* Ignorar */ }
.                           
%%

int main(int argc, char **argv) {
    if (argc > 1) {
        FILE *file = fopen(argv[1], "r");
        if (!file) {
            perror("Error al abrir el archivo");
            return 1;
        }
        yyin = file;
    }
    yylex();
    printf("Total de comentarios encontrados: %d\n", comment_count);
    return 0;
}

int yywrap() {
    return 1;
}
