#include <stdio.h>
#include <stdlib.h>
#include <time.h>
int main()
{
   FILE * fp;
   fp=fopen("sample.txt", "w");
   if (fp == NULL)
    {
      printf("\n\n\n\n------>Couldn't open sample.txt for writing.\n");
      exit(0);
    }
   clock_t begin, end;
   double time_spent;
   begin=clock();
   int i=0,j=0,k=0;
   do
    {
      if ( ++i%10 != 0)
          fprintf(fp, "%d", i);
      else
          fprintf(fp,"\n");

      if(i%2 == 0 || i%3 ==0)
           j++;
      else
          k++;
    }while(i<10000000);

    end = clock();
    time_spent=(double)(end-begin) / CLOCKS_PER_SEC;
    printf("\n---->Time Spent: %f",time_spent);
    fclose(fp);
    return 0;

}
