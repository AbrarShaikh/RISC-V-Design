//#include <stdio.h>

int main()
{
    float a=1.1,b=1.1,c;
    int A=1,B=1,C,s=0;

 /*  printf("select Oprtn : \n(add: 0, sub: 1, mul: 2, div:3)\n(and: 4, or: 5, xor: 6, LR-shit:7)\n");
    scanf("%d",&s);

    if(s < 4){
        printf("enter 2 float numbers\n");
        scanf("%f %f",&a, &b);
    }
    else{
        printf("enter 2 int numbers\n");
        scanf("%d %d",&A, &B);
    }
    */
    switch(s)
    {
        case 0:
        c = a+b;
        //printf("%.2f + %.2f: %.2f\n", a,b,c);
        break;

        case 1:
        c = a-b;
        //printf("%.2f - %.2f: %.2f\n", a,b,c);
        break;

        case 2:
        c = a*b;
        //printf("%.2f * %.2f: %.2f\n", a,b,c);
        break;

        case 3:
        c = a/b;
        //printf("%.2f / %.2f: %.2f\n", a,b,c);
        break;

        case 4:
        C = A&B;
        //printf("%X & %X: %X\n", A,B,C);
        break;
        
        case 5:
        C = A|B;
        //printf("%X | %X: %X\n", A,B,C);
        break;

        case 6:
        C = A^B;
        //printf("%X ^ %X: %X\n", A,B,C);
        break;
        case 7:

        C = A<<B;
        //printf("%X << %X: %X\n", A,B,C);
        C = A>>B;
        //printf("%X >> %X: %X\n", A,B,C);
        break;

        default:
        return 1;
        //printf("ERROR : incorrect Oprtn\n");
    }

    return 0;
}

