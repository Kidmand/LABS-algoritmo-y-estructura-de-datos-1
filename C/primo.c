#include <stdio.h>
#include <stdlib.h>
#include <math.h>


int  nesimo_primo(int);
int pedirEntero();

int pedirEntero()
{ int x;
  printf ("Ingrese el n-esimo primo que quiere saber. Debe ser un numero positivo: ");
  scanf("%d",&x);
  return x;
}

int  nesimo_primo(int N)
    
{   int recorredor=0, divisor=3, primo, dividendo=5;

    if (N==1 || N==2) primo=N+1;
    else {
          while (recorredor<N-2) {  
               if (sqrt(dividendo)<divisor) {
                    primo=dividendo; divisor=3; recorredor++; dividendo+=2;
                  }//Estoy descartando a todos los números pares. 
                 else if (dividendo%divisor==0) {
                       divisor=3; dividendo+=2;
                     } // Empiezo a dividir desde 3 en adelante, ya que por 2 no es necesario.
                        else {divisor++;}
    }
         } return primo;
}//aplicamos el Teorema fundamental de la aritmética. 
// x,y,z pertenece a los Nat x = y*z    donde y,z < sqrt(x). 
// donde y,z pueden ser cualquier Nat < sqrt(x). 

int main()
{ int n_esimo=pedirEntero();
 if (n_esimo<=0)
   {
    (printf("Usted es o se hace, ingrese un valor positivo: "));
     scanf("%d",&n_esimo);
     }
 if (n_esimo>0) printf("El primo numero %d es: %d\n",n_esimo,nesimo_primo(n_esimo));
   else printf("Si usted no es capaz de hacer caso, lo hare por usted. El primo numero 10 es 29\n");
 getchar();
 return 0;
}

