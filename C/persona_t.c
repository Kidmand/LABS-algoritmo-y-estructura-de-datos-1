#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

int pedirEntero();

int pedirEntero()
{ int x;
  printf ("La longitud debe ser > 1. Ingrese longitud del arreglo: ");
  scanf("%d",&x);
  return x;
}

/*typedef struct _persona {
char nombre[200];
int edad;
float altura;
float peso;
} persona_t;

float peso_promedio(persona_t arr[], unsigned int longitud)
{   float promedio=0;
    for (unsigned int corredor=0;corredor<longitud;corredor++)
    {
      promedio+=(arr[corredor].peso);
    }
  return promedio/longitud;
}

persona_t persona_de_mayor_edad(persona_t arr[], unsigned int longitud)
{
    unsigned int corredor=1;
    int posicionx=0;
    persona_t guardar;
    while (corredor<longitud)
    {
        if (arr[posicionx].edad>=(arr[corredor].edad)) 
        {
         guardar=arr[posicionx];
         corredor++;
        } 
          else 
          { 
           guardar=arr[corredor];
           posicionx=corredor;
           corredor++;
          }
    }
 return guardar;
}

persona_t persona_de_menor_altura(persona_t arr[], unsigned int longitud)
{
    unsigned int corredor=1;
    int posicionx=0;
    persona_t guardar;
    while (corredor<longitud)
    {
        if (arr[posicionx].altura>=(arr[corredor].altura)) 
        { 
         guardar=arr[corredor];
         posicionx=corredor;
         corredor++;
        } 
          else 
          {
           guardar=arr[posicionx];
           corredor++;
          }
    }
 return guardar;
}

persona_t* pedirArreglo(persona_t vector[], int longitud)
{   for (int posicion=0;posicion<longitud;posicion++) 
    {
     printf("Ingrese su nombre: ");
     scanf("%s",*&vector[posicion].nombre);
     printf("Ingrese su edad: ");
     scanf("%d",&vector[posicion].edad);
     printf("Ingrese su altura: ");
     scanf("%f",&vector[posicion].altura);
     printf("Ingrese su peso: ");
     scanf("%f",&vector[posicion].peso);
    } 
 printf("\n");
 return vector;   
}*/

typedef struct _persona {
char *nombre;
int edad;
float altura;
float peso;
} persona_t; 

float peso_promedio(persona_t arr[], unsigned int longitud);
persona_t persona_de_mayor_edad(persona_t arr[], unsigned int longitud);
persona_t persona_de_menor_altura(persona_t arr[], unsigned int longitud);

persona_t* pedirArreglo (persona_t arr[], int tam) {
    for (int counter=0; counter<tam; counter++) {
        printf("Ingrese nombre de la persona: ");
        scanf ("%s",&arr[counter].nombre); 
        printf("Ingrese edad de la persona: ");
        scanf ("%d",&arr[counter].edad); 
        printf("Ingrese altura de la persona: ");
        scanf ("%f",&arr[counter].altura); 
        printf("Ingrese peso de la persona: ");
        scanf ("%f",&arr[counter].peso); 
    }

    return arr;
};

float peso_promedio(persona_t arr[], unsigned int longitud) {
    float guardador = 0;
    for (int counter=0; counter<longitud; counter++){
        guardador+=arr[counter].peso;
    }
    return guardador/longitud;
}

persona_t persona_de_mayor_edad(persona_t arr[], unsigned int longitud){
    persona_t mayor;
    int auxiliar=1;
    for (int counter=0; counter<longitud; counter++){
        if (arr[counter].edad>=arr[auxiliar].edad) {
            mayor=arr[counter];
            auxiliar=counter;
        } else {
            mayor=arr[auxiliar];
        }
        
    } return mayor;
}

persona_t persona_de_menor_altura(persona_t arr[], unsigned int longitud){
    persona_t menor;
    int auxiliar=1;
    for (int counter=0; counter<longitud; counter++){
        if (arr[counter].altura<=arr[auxiliar].altura) {
            menor=arr[counter];
            auxiliar=counter;
        } else {
            menor=arr[auxiliar];
        }
        
    } return menor;
}


int main()
{unsigned int longitud = pedirEntero();
 assert(longitud>=2);
 persona_t vector[longitud];
 persona_t* arreglo = pedirArreglo(vector,longitud);
 printf("El peso promedio es %3.1f\n",peso_promedio(arreglo,longitud));
 printf("La persona de mayor edad es %s\n", (persona_de_mayor_edad(arreglo,longitud).nombre));
 printf("La persona de menor altura es %s\n",(persona_de_menor_altura(arreglo,longitud)).nombre);
 getchar();
 return 0;

}


