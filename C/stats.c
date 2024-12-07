#include <stdio.h>
#include <stdlib.h>

struct datos_t stats(float a[], int);
void imprime_struct(struct datos_t);
float* pedirArreglo(float a[], int);
float pedirEntero();

float pedirEntero()
{ float x;
  printf ("Ingrese longitud del arreglo: ");
  scanf("%f",&x);
  return x;
}

float* pedirArreglo(float a[], int n_max)
{   for (int corredor=0;corredor<n_max;corredor++) 
    {  printf("Ingrese valor para la posicion %d del arreglo: ",corredor);
       scanf("%f",&a[corredor]);
    } 
 printf("\n");
 return a;   
}

struct datos_t {
float maximo;
float minimo;
float promedio;
};

void imprime_struct(struct datos_t def)
{
 printf("Maximo %3.1f\nMinimo %3.1f\nPromedio %3.1f\n",def.maximo,def.minimo,def.promedio);
}

struct datos_t stats(float a[], int tam)
{
    struct datos_t def;
    int pasivo1=0;
    int corredor=1;
    int pasivo2=0;
    
    while (corredor<(tam)) 
    {
        if (a[pasivo1]>=a[corredor]) def.maximo=a[pasivo1];
          else {
                 def.maximo=a[corredor];
                 pasivo1=corredor;
               }
      
         if (a[pasivo2]<=a[corredor]) def.minimo=a[pasivo2];
           else {
                  def.minimo=a[corredor];
                  pasivo2=corredor;
                }      
    
        def.promedio+= a[corredor];
        corredor++;

    }
    
    def.promedio=(def.promedio+a[0])/tam;
    
return def;
}

int main()
{  int tam=pedirEntero();
   float vector[tam];
   imprime_struct(stats(pedirArreglo(vector,tam),tam));
   getchar();
 return 0;
}







