#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define N 8 * 1000

int A[N];

int gtchk(const void *a, const void *b)
{
	return *(int *)a - *(int *)b;
}

int main()
{
	int i;
	time_t st, et;
	srand(0);
	for (i = 0; i < N; i++)
		A[i] = rand();
	st = clock();
	qsort(A, N, sizeof(int), gtchk);
	for (i = 1; i < N; i++)
		if (gtchk(&A[i - 1], &A[i]) > 0)
			break;
	et = clock();
	printf("Elapsed time = %fs stop at %d\n", (et - st) * 1.0 / CLOCKS_PER_SEC, i);
	return 0;
}