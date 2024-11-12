#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>

char* good_string = (char*)"Phacomochere\0";
int size_good_string = 0;

uint64_t good_value = 0x6964654A654C6F59;

static bool RootFunction(char* string, uint64_t value)
{
    if (string == NULL)
        return false;

    size_good_string = strlen(good_string) + 1;
 
    for (int i = 0; i < size_good_string; ++i)
    {
        if (string[i] != good_string[i])
            return false;
    }

    if (value != good_value)
        return false;

    return true;
}

int main(int argc, char *argv[])
{
    size_good_string = strlen(good_string) + 1;

    if (argc != 3) {
        fprintf(stderr, "Usage: %s <string> <hex_value>\n", argv[0]);
        return 1;
    }

    uint64_t value = strtoull(argv[2], NULL, 16);

    if (RootFunction(argv[1], value)) {
        printf("RootFunction returned true.\n");
    } else {
        printf("RootFunction returned false.\n");
    }

    return 0;
}