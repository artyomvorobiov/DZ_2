#include <stdio.h>
#include <string.h>

int Len(char *s){
    int x;
    x = strlen(s);
    return x;
}

int main(void) {
    int X[5] = {0,0,0,0, 0};
    FILE *f;
    char s[10000];
    f = fopen("/home/artyom/CLionProjects/untitled3/text", "r");
    while (fgets(s, 10000, f) != NULL);
    int l;
    l = Len(s);
    printf("%d", l);
    if (l != 0) {
        for (int i = 0; i < l; i++) {
            if (s[i] == 'i' && (i <= l - 3) && ((i == 0) || (s[i - 1] == ' ')) && (s[i + 1] == 'n') &&
                (s[i + 2] == 't') &&
                ((i == l - 3) || (s[i + 3] == ' '))) {
                X[0] += 1; // int
            } else if (s[i] == 'i' && (i <= l - 2) && ((i == 0) || (s[i - 1] == ' ')) && (s[i + 1] == 'f') &&
                       ((i == l - 2) || (s[i + 2] == ' '))) {
                X[1] += 1; // if
            } else if (s[i] == 'd' && (i <= l - 2) && ((i == 0) || (s[i - 1] == ' ')) && (s[i + 1] == 'o') &&
                       ((i == l - 2) || (s[i + 2] == ' '))) {
                X[2] += 1; // do
            } else if (s[i] == 'f' && (i <= l - 3) && ((i == 0) || (s[i - 1] == ' ')) && (s[i + 1] == 'o') &&
                       (s[i + 2] == 'r') && ((i == l - 3) || (s[i + 3] == ' '))) {
                X[3] += 1; // for
            } else if (s[i] == 'g' && (i <= l - 4) && ((i == 0) || (s[i - 1] == ' ')) && (s[i + 1] == 'o') &&
                       (s[i + 2] == 't') && (s[i + 3] == 'o') && ((i == l - 4) || (s[i + 4] == ' '))) {
                X[4] += 1; // goto
            }
        }
        printf("int, if, do, for, goto: ");
        for (int i = 0; i < 5; i++){
            printf("%d ", X[i]);
        }
    }
    else {
        printf("Пустой файл ");
    }
    fclose(f);
}
