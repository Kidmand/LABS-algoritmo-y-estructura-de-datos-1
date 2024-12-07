#include <stdio.h>
#include <stdlib.h>
#define tama 3

int sumatoria(int a[], int);
int* pedirArreglo(int a[], int);

int sumatoria(int a[], int tam)
{  int guardador=0;
   for (int corredor=0;corredor<tam;corredor++)
   guardador+=a[corredor];
return guardador;   
}

int* pedirArreglo(int a[], int n_max)
{   for (int corredor=0;corredor<n_max;corredor++) 
    {  
      printf("Ingrese valor para la posicion %d del arreglo: ",corredor);
      scanf("%d",&a[corredor]);
    } 
return a;   
}

int main()
{ int vector[tama];
  printf("La suma de los elementos del arreglo es %d\n",sumatoria(pedirArreglo(vector,tama),tama));
  getchar();
  return 0;
}

