#include <stdio.h>
#include <string.h>

int main(int argc, char *argv[]) {
    const char *good_string = "IHateObfuscation";
    char input_string[100];
    char result[100] = "";
    int correct = 1;

    printf("Please enter the string: ");
    fgets(input_string, sizeof(input_string), stdin);
    
    // Remove newline character from input_string
    input_string[strcspn(input_string, "\n")] = '\0';

    if (strlen(input_string) != strlen(good_string)) {
        correct = 0;
    } else {
        for (int i = 0; i < strlen(good_string); i++) {
            if (input_string[i] != good_string[i]) {
                correct = 0;
                break;
            } else {
                strncat(result, &input_string[i], 1);
            }
        }
    }
    
    // Check if result matches good_string
    printf("The string is %scorrect \n", strcmp(result, good_string) == 0 ? "" : "in");

    return 0;
}