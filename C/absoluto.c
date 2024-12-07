#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

int main()
{ int x;
  printf ("Ingrese un valor: ");
  scanf("%d",&x);
  assert(x==x);
  if (x<=0) {x=-x;}
  else {x=x;}
  assert(x>=0);
  printf("El valor absoluto es: %d\n",x);
  getchar();
  return 0;

}