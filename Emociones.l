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
        {"Alegr�a", 0},
        {"Esperanza", 0},
        {"�xito", 0},
        {"Tristeza", 0},
        {"Miedo", 0},
        {"Enojo", 0},
        {"Derrota", 0}
    };
    
    #define NUM_EMOTIONS (sizeof(emotions) / sizeof(emotions[0]))
%}

%%

querer|amar|cari�o|ternura|admiraci�n|afecto  { emotions[0].count++; }
feliz|contento|entusiasmo|risa|euforia|placer { emotions[1].count++; }
optimismo|confianza|ilusi�n|motivaci�n|inspirador { emotions[2].count++; }
logro|triunfo|superaci�n|avanzar|ganar|orgullo { emotions[3].count++; }
llanto|soledad|vac�o|desesperaci�n|p�rdida|dolor { emotions[4].count++; }
temor|angustia|inseguridad|p�nico|horror|amenaza { emotions[5].count++; }
ira|odio|rabia|resentimiento|frustraci�n|venganza { emotions[6].count++; }
fracaso|depresi�n|p�rdida|humillaci�n|rechazo { emotions[7].count++; }

[\n ]+  ; // Ignorar espacios y saltos de l�nea
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