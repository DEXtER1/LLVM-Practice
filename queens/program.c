/***********************************************************
* You can use all the programs on  www.c-program-example.com
* for personal and learning purposes. For permissions to use the
* programs for commercial purposes,
* contact info@c-program-example.com
* To find more C programs, do visit www.c-program-example.com
* and browse!
*
*                      Happy Coding
***********************************************************/

#include<stdio.h>
#include<math.h>
#include <time.h>
int a[30],count=0;
clock_t begin,end;
double time_spent;
FILE *fp;

int place(int pos)
{
 int i;
 for(i=1;i<pos;i++)
 {
  if((a[i]==a[pos])||((abs(a[i]-a[pos])==abs(i-pos))))
   return 0;
 }
 return 1;
}
void print_sol(int n)
{
 int i,j;
 count++;
 fprintf(fp,"\n\nSolution #%d:\n",count);
 for(i=1;i<=n;i++)
 {
  for(j=1;j<=n;j++)
  {
   if(a[i]==j)
    fprintf(fp,"Q\t");
   else
    fprintf(fp,"*\t");
  }
  fprintf(fp,"\n");
 }
}
void queen(int n)
{
 int k=1;
 a[k]=0;
 while(k!=0)
 {
  a[k]=a[k]+1;
  while((a[k]<=n)&&!place(k))
   a[k]++;
  if(a[k]<=n)
  {
   if(k==n)
    print_sol(n);
   else
   {
    k++;
    a[k]=0;
   }
  }
  else
   k--;
 }
}
int main(int argc, char *argv[])
{
 int i,n;
 fp= fopen(argv[2],"w");
 if( fp == NULL )
  {
    printf("\n\n\nCould not open file %s",argv[2]);
    exit(0);
  }

 //clrscr();
 begin = clock();
 //printf("Enter the number of Queens\n");
 n = atoi(argv[1]);
 // scanf("%d",&n);
 queen(n);
 // printf("\nTotal solutions=%d",count);
 end = clock();
 time_spent = (double)(end-begin) / CLOCKS_PER_SEC;
 printf("\nDuration: %f \t Queens: %d \t Solutions: %d",time_spent,atoi(argv[1]),count);
 fclose(fp);
return 0;
}
