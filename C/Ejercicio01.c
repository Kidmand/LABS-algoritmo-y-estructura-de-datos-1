#include <stdio.h>
#include <assert.h>
#include <stdlib.h>

void holaHasta(int);
int pedirEntero();

int pedirEntero()
{ int x;
  printf ("Ingrese un valor: ");
  scanf("%d",&x);
  return x;
}

void holaHasta(int n)
{
    int const cantidad = n;
    for (n=0;n<cantidad;n++)
    printf("Hola\n");
}

int main()
 {  
  int cantidad = pedirEntero();
  assert (cantidad>0);
  holaHasta(cantidad);
  getchar();
  return 0;
 }
