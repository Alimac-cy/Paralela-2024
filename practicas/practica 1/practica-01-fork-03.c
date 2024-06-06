// practica-01-fork-03.c
#include <stdio.h>
#include <unistd.h>
int main(void)
{
    printf("//\n");
    pid_t pid = fork();
    int valorRetorno;

    if (pid == 0)
    {
        sleep(5);
        printf("Hello from the other side\n");
    }
    else
    {
        waitpid(-1, &valorRetorno, 0);
        printf("Hello, it's me\n");
    }

    printf("//\n");
    return 0;
}