#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

int pedirEntero();

int pedirEntero()
{ int x;
  printf ("Ingrese un valor: ");
  scanf("%d",&x);
  return x;
}

int main()
{int aux;
 int x = pedirEntero();
 int y = pedirEntero();
 aux=x;
 x++;
 y=aux+y;
 printf("El valor de las variables son: x=%d y=%d\n",x,y);
 getchar();
 return 0;
}