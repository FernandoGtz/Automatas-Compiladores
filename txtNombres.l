%option noyywrap
%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>

    #define MAX_NAMES 1000  // Máximo número de nombres distintos

    typedef struct {
        char name[50];  // Nombre detectado
        int count;      // Veces que aparece
    } NameCount;

    NameCount names[MAX_NAMES];  // Almacenar nombres
    int nameIndex = 0;  // Índice actual

    void addName(char *word) {
	int i;
        for (i = 0; i < nameIndex; i++) {
            if (strcmp(names[i].name, word) == 0) {
                names[i].count++;
                return;
            }
        }
        // Agregar nuevo nombre
        if (nameIndex < MAX_NAMES) {
            strcpy(names[nameIndex].name, word);
            names[nameIndex].count = 1;
            nameIndex++;
        }
    }

    // Función para comparar y ordenar los nombres por frecuencia (para top 5)
    int compare(const void *a, const void *b) {
        return ((NameCount*)b)->count - ((NameCount*)a)->count;
    }
%}

%%
[A-Z][a-z]+    { addName(yytext); } // Detecta nombres propios
[ \t\n]+       ; // Ignorar espacios y saltos de línea
.              ; // Ignorar otros caracteres
%%

int main() {
    yyin = fopen("El_Prisionero_de_Azkaban.txt", "r"); // Redirigir entrada a archivo
    yylex();

    printf("\nTop 5 nombres más mencionados:\n");
        qsort(names, nameIndex, sizeof(NameCount), compare);
	int i;
        for (i = 0; i < 5 && i < nameIndex; i++) {
            printf("%d. %s - %d veces\n", i + 1, names[i].name, names[i].count);
        } // Imprimir los 5 nombres más mencionados
    return 0;
}
