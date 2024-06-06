// practica-01-fork-02.c
#include <stdio.h>
#include <unistd.h>
int main(void)
{
    pid_t pid = fork();
    if (pid == 0)
    {
        sleep(5);
        printf("Hello from the other side\n");
    }
    else
    {
        printf("Hello, it's me\n");
    }
    return 0;
}