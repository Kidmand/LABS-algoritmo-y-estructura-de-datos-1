#include <stdbool.h> 
#include <stdio.h>
#include <stdlib.h>

int pedirEntero()
{ int x;
  printf ("Ingrese un valor: ");
  scanf("%d",&x);
  return x;
}

int main()
{
 int aux;
 int x = pedirEntero();
 int y = pedirEntero();
 int z = pedirEntero();
 aux=x;
 x=y;
 y=x+aux+z;
 z=x+aux;
 printf("El valor de las variables son: x=%d y=%d z=%d\n",x,y,z);
 getchar();
 return 0;
}