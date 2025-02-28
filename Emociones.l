%option noyywrap
%{
    #include <stdio.h>
    #include <stdlib.h>

    typedef struct {
        char *emotion;
        int count;
    } Emotion;

    Emotion emotions[] = {
        {"Amor", 0},
        {"Alegría", 0},
        {"Esperanza", 0},
        {"Éxito", 0},
        {"Tristeza", 0},
        {"Miedo", 0},
        {"Enojo", 0},
        {"Derrota", 0}
    };
    
    #define NUM_EMOTIONS (sizeof(emotions) / sizeof(emotions[0]))
%}

%%

querer|amar|cariño|ternura|admiración|afecto  { emotions[0].count++; }
feliz|contento|entusiasmo|risa|euforia|placer { emotions[1].count++; }
optimismo|confianza|ilusión|motivación|inspirador { emotions[2].count++; }
logro|triunfo|superación|avanzar|ganar|orgullo { emotions[3].count++; }
llanto|soledad|vacío|desesperación|pérdida|dolor { emotions[4].count++; }
temor|angustia|inseguridad|pánico|horror|amenaza { emotions[5].count++; }
ira|odio|rabia|resentimiento|frustración|venganza { emotions[6].count++; }
fracaso|depresión|pérdida|humillación|rechazo { emotions[7].count++; }

[\n ]+  ; // Ignorar espacios y saltos de línea
.       ; // Ignorar otros caracteres

%%

int main() {
    yyin = fopen("El_Prisionero_de_Azkaban.txt", "r"); // Leer archivo
    yylex();
    fclose(yyin);
    
    printf("\nConteo de emociones:\n");
    int i;
    for (i = 0; i < NUM_EMOTIONS; i++) {
        printf("%s: %d\n", emotions[i].emotion, emotions[i].count);
    }
    return 0;
}