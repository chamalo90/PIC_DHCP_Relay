#include <stdio.h>

int main(){
    char str[32];
    int value = 42;
    int_to_string(value, str);
    printf("%s\n", str);
    return 0;
}
