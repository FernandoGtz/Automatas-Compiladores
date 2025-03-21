%{
#include <stdio.h>
#include <string.h>

int count_poter = 0;
int count_potter = 0;
FILE *output_file;

// Función para comparar y corregir
int comparar_y_corregir(const char* palabra) {
    char cad1[] = "Potter";
    char cad2[] = "POTTER";
    char cad3[] = "Poter";
    char cad4[] = "POTER";

    if (strcmp(palabra, cad1) == 0 || strcmp(palabra, cad2) == 0) {
        // Si es 'Potter' o 'POTTER', no hacer nada
        return 0;
    } else if (strcmp(palabra, cad3) == 0 || strcmp(palabra, cad4) == 0) {
        // Si es 'Poter' o 'POTER', corregir a 'Potter'
        return 1;
    }
    return 0;
}

%}

%%

"Poter"   { 
            count_poter++; 
            // Corregir 'Poter' a 'Potter'
            if (comparar_y_corregir(yytext)) {
                fprintf(output_file, "Potter");
            }
          }
"Potter"  { 
            count_potter++; 
            fprintf(output_file, "Potter");  // Escribir 'Potter' tal cual en el archivo de salida
          }
.|\n      { fprintf(output_file, "%s", yytext); }  // Imprimir cualquier otro carácter tal cual

%%

int main(int argc, char **argv) {
    FILE *file;
    if (argc > 1) {
        file = fopen(argv[1], "r");
        if (file == NULL) {
            printf("No se puede abrir el archivo.\n");
            return 1;
        }
        yyin = file;
    } else {
        printf("Por favor, ingresa el nombre del archivo.\n");
        return 1;
    }
    
    output_file = fopen("El_Prisionero_de_Azkaban_corregido.txt", "w");  // Abrir archivo de salida
    if (output_file == NULL) {
        printf("No se puede crear el archivo de salida.\n");
        return 1;
    }
    
    yylex();  // Ejecuta el analizador léxico
    
    printf("Palabras 'Poter' encontradas: %d\n", count_poter);
    printf("Palabras 'Potter' encontradas: %d\n", count_potter);
    printf("Corrigiendo la palabra 'Poter' por 'Potter'...");

    fclose(file);
    fclose(output_file);
    return 0;
}

int yywrap(void) {
    return 1;  // Indica que no hay más archivos para procesar
}
