#include <stdio.h>

int main()
{
    // Array of char* elements (C "strings")
    fptr = fopen("filename.txt", "r");
    fptr2 = fopen("filename2.txt", "w");

    // checking if the file is opened successfully
    if (fptr == NULL)
    {
        printf("The file is not opened. The program will "
               "now exit.");
        exit(0);
    }
    if (fptr2 == NULL)
    {
        printf("The file is not opened. The program will "
               "now exit.");
        exit(0);
    }
    char c;
    while ((c = fgetc(fptr)) != EOF)
    {
        printf("%c\n", c);
        fputc(c, fptr2);
    }
    fclose(fptr);
    fclose(fptr2);
}