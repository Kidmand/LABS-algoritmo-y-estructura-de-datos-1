#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

int main()
{ int x,y;
  int const N,T;
  printf ("Ingrese un valor: ");
  scanf("%d",&N);
  printf ("Ingrese otro valor: ");
  scanf("%d",&T);
  y=T;
  x=N;
  assert(x==N && y==T);
  if (y>=N) {x=x;}
  else {x=T;}
  assert(x<=N && x<=y);
  printf("El valor mas chico es: %d\n",x);
  getchar();
  return 0;

}