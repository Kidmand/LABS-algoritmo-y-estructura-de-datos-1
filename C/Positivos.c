#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#define tama 5

bool existe_positivo(int a[], int);
bool todos_positivos(int a[], int);
int* pedirArreglo(int a[], int);

int pedirEntero()
{ int x;
  printf ("Si presiona 1, ejecuta la funcion existe_positivo.\nSi presiona otro numero distinto de 1, ejecuta la funcion todos_positivos.\n");
  scanf("%d",&x);
  return x;
}

int* pedirArreglo(int a[], int n_max)
{   for (int corredor=0;corredor<n_max;corredor++) 
    {  printf("Ingrese valor para la posicion %d del arreglo: ",corredor);
       scanf("%d",&a[corredor]);
    } 
return a;   
}

bool existe_positivo(int a[], int tam)
{
    int corredor=0;
    while (corredor<tam) {
        if (a[corredor]>0) return true;
        else (corredor++);
    } if (corredor==tam) return false;
}

bool todos_positivos(int a[], int tam)
{
    int corredor=0;
    while (corredor<tam) {
        if (a[corredor]<0) return false;
        else (corredor++);
    } if (corredor==tam) return true;
}

int main()
{
    int vector[tama];
    pedirArreglo (vector,tama);
    {
        if (pedirEntero()==1) {
            if (existe_positivo(vector,tama)==1) printf("True\n");
              else (printf("False\n"));
              }
        else {
            if (todos_positivos(vector,tama)==1) printf("True\n");
              else (printf("False\n"));}
              }
    getchar();
    return 0;
}
