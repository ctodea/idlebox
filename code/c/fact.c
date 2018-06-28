#include <stdio.h>
#include <stdlib.h>
int main(int argc, char const *argv[])
{
    
    for(size_t i = 1; i < argc; i++)
    {
        int n = atoi(argv[i]);
        if (n < 0) 
        {
            printf("Input can't be negative\n"); 
            return 1;
        }
        else
        {
            unsigned long long factorial = 1;
            for(int j = 1; j <= n; j++)
            {
                factorial *= j;
            }
            printf("Factorial of %d = %llu\n", n, factorial);
        }
    }
     
    
    
    return 0;
}

