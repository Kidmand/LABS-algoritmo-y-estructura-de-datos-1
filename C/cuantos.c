#include <stdio.h>
#include <stdlib.h>

struct comp_t cuantos(int a[], int, int);
void imprime_struct(struct comp_t);
int* pedirArreglo(int a[], int);
int pedirEntero();

int pedirEntero()
{ int x;
  printf ("Ingrese longitud del arreglo: ");
  scanf("%d",&x);
  return x;
}

int* pedirArreglo(int a[], int n_max)
{  
    for (int corredor=0;corredor<n_max;corredor++) 
    {printf("Ingrese valor para la posicion %d del arreglo: ",corredor);
      scanf("%d",&a[corredor]);
    } 
 printf("\n");
 return a;   
}

struct comp_t
{
 int menores;
 int iguales;
 int mayores;
};

struct comp_t cuantos(int a[], int tam, int elem)
{
    struct comp_t def; 
    def.iguales=0;
    def.menores=0;
    def.mayores=0;

    for (int corredor=0; corredor<tam; corredor++){
      if (a[corredor]==elem) def.iguales++;
       else {
             if (a[corredor]>elem) def.mayores++;
              else def.menores++;
            }              
    }
return def;
}

//Tranquilamente la función imprime_struct podría no estar definida, ya que podemos simplemente definir la salida de cuantos como void.
//Es decir, que podemos imprimir los valores por pantalla directamente de la función cuantos. 
void imprime_struct(struct comp_t def)
{
    printf("Menores %d\nMayores %d\nIguales %d\n",def.menores,def.mayores,def.iguales);
}

int main()
{   int tam=pedirEntero();
    int vector[tam];
    int comparar;
    printf("Ingrese el valor que quiere que sea comparado: ");
    scanf("%d",&comparar);
    imprime_struct(cuantos(pedirArreglo(vector,tam),tam,comparar));
    getchar();
    return 0;
}




