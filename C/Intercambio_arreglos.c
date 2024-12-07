#include <stdio.h>
#include <stdlib.h>

void intercambiar(int a[], int, int, int);
void imprimeArreglo(int a[], int);
int* pedirArreglo(int a[], int);
int pedirEntero();

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
    printf("El valor de la posicion %d del arreglo es: %d \n",corredor,a[corredor]);
}

void intercambiar(int a[], int tam, int i, int j)
{ i--;
  j--;
  int aux1=a[i];
  a[i]=a[j];
  a[j]=aux1;
  printf("\n");
  imprimeArreglo(a,tam);
}

int main()
{
   { int posicion1;
     int posicion2;
     int tam=pedirEntero();
     int vector[tam];
     printf("Ingrese una posicion del arreglo: ");
     scanf("%d",&posicion2);
     printf("Ingrese otra posicion del arreglo: ");
     scanf("%d",&posicion1);
     printf("\n");
     if (posicion1<=tam && posicion2<=tam) {intercambiar(pedirArreglo (vector,tam),tam,posicion1,posicion2);}
     else (printf("Error, algunas de las posiciones que ingreso es mayor que la longitud del arreglo\n"));
   }
   getchar();
   return 0;
   
}

