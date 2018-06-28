#include <stdio.h>
int main()
{
    int n;
    printf("Input number: ");
    scanf("%d",&n);
    
    if (n < 0) 
    {
        printf("Input can't be negative\n"); 
        return 1;
    }
    else
    {
        unsigned long long factorial = 1;
        for(int i = 1; i <= n; i++)
        {
            factorial *= i;
        }
        printf("Factorial of %d = %llu\n", n, factorial);
    }
    
    return 0;
}
