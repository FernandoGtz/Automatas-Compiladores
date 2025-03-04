%option noyywrap
%{
#include <stdio.h>
#include <ctype.h>

FILE *out; // Archivo de salida
%}

%%

[A-Z]   { fputc(tolower(yytext[0]), out); } // Convierte mayúsculas a minúsculas
.       { fputc(yytext[0], out); } // Copia otros caracteres sin cambios

%%

int main(int argc, char *argv[]) {
    if (argc != 3) {
        printf("Uso: %s <archivo_entrada> <archivo_salida>\n", argv[0]);
        return 1;
    }

    FILE *in = fopen(argv[1], "r");
    if (!in) {
        perror("Error al abrir el archivo de entrada");
        return 1;
    }

    out = fopen(argv[2], "w");
    if (!out) {
        perror("Error al abrir el archivo de salida");
        fclose(in);
        return 1;
    }

    yyin = in;  // Establece el archivo de entrada para Flex
    yylex();    // Ejecuta el análisis léxico

    fclose(in);
    fclose(out);

    printf("Conversión completada. Texto guardado en %s\n", argv[2]);
    return 0;
}
