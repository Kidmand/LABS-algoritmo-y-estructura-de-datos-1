#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

int main()
{ int x,y,z;
  printf ("Ingrese un valor para x: ");
  scanf("%d",&x);
  printf ("Ingrese un valor para y: ");
  scanf("%d",&y);
  assert(x==x&&y==y);
  z=x;
  x=y;
  y=z;
  assert(z==y);
  printf("El valor de las variables es x=%d y=%d\n",x,y);
  getchar();
  return 0;

}