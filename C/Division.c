#include <stdio.h>
#include <assert.h>
#include <stdlib.h>

int pedirEntero();
struct div_t division(int, int);

int pedirEntero()
{ int x;
  printf ("Ingrese un valor: ");
  scanf("%d",&x);
  return x;
}

struct div_t {
int cociente;
int resto;
};
struct div_t division(int dividendo, int divisor)
{ struct div_t def;
int aux=dividendo;
      dividendo/=divisor;
      def.resto=aux-(divisor*dividendo);
def.cociente = dividendo;
return def;
}

int main()
{ struct div_t def; 
  int dividendo=pedirEntero();
  int divisor=pedirEntero();
  if (divisor==0) (printf("Error, no se puede dividir por 0.\n"));
  else {def=division(dividendo,divisor);
  printf("El cociente es %d y  el resto es %d\n", def.cociente,def.resto);}
  getchar();
  return 0;
}





