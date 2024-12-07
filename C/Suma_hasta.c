#include <stdio.h>
#include <stdlib.h>

int suma_hasta(int);
int pedirEntero();

int pedirEntero()
{ int x;
  printf ("Ingrese el valor hasta donde quiere sumar: ");
  scanf("%d",&x);
  return x;
}

int suma_hasta(int x)
{
  return (x*(x+1))/2;
}
int main()
{
  int x = pedirEntero();
  if (x>=0) (printf("El valor de la sumatoria hasta %d es: %d\n",x,suma_hasta(x)));
  else (printf("Error, la sumatoria no esta definida para numeros negativos.\n"));
  getchar();
  return 0;
}