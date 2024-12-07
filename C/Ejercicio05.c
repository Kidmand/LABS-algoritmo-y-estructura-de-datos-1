#include <stdio.h>
#include <stdlib.h>

int* pedirArreglo(int a[], int);
void imprimeArreglo(int a[], int);

int pedirEntero()
{ int x;
  printf ("Ingrese longitud del arreglo: ");
  scanf("%d",&x);
  return x;
}

int* pedirArreglo(int a[], int n_max)
{   for (int corredor=0;corredor<n_max;corredor++) 
    { 
       printf("Ingrese valor para la posicion %d del arreglo: ",corredor);
       scanf("%d",&a[corredor]);
    } 
return a;   
}

void imprimeArreglo(int a[], int n_max)
{   for (int corredor=0;corredor<n_max;corredor++)
    {
      printf("El valor de la posicion %d del arreglo es: %d \n",corredor,a[corredor]);
    }
}

int main()
{
  int tam=pedirEntero();
  int vector[tam];
  imprimeArreglo(pedirArreglo(vector,tam),tam);
  getchar();
  return 0;
}
