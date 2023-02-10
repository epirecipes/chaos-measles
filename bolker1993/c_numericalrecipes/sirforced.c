#include <stdio.h>
#include "math.h"
#define NRANSI
#include "nr.h"
#include "nrutil.h"

#define K 3

#define N 5.0e7
#define S0 5.0e7-1.0
#define I0 1.0
#define E0 0.0
#define MU 0.02
#define GAMMA 73.0
#define SIGMA 45.6
#define BETA 1.5e-5+8.5e-6*(1+cosf(2*M_PI*x))
#define FILENAME "sirforced.dat"

float dxsav,*xp,**yp;  /* defining declarations */
int kmax,kount;

int nrhs;   /* counts function evaluations */

void derivs(float x,float y[],float dydx[])
{
	nrhs++;
    dydx[1] = MU*N - (MU+BETA*y[2])*y[1];
	dydx[2] = BETA*y[2]*y[1] - (MU+SIGMA)*y[2];
	dydx[3] = SIGMA*y[2] - GAMMA*y[3];
}

int main(void)
{
	int i,nbad,nok;
	float eps=5.0e-6,h1=1.0/365,hmin=0.0,x1=0.0,x2=30.0,*ystart;

	ystart=vector(1,K);
	xp=vector(1,300);
	yp=matrix(1,3,1,300);
	ystart[1]=S0;
	ystart[2]=E0;
	ystart[3]=I0;
	nrhs=0;
	kmax=100000;
	dxsav=(x2-x1)/300.0;
	odeint(ystart,K,x1,x2,eps,h1,hmin,&nok,&nbad,derivs,rkqs);
	printf("\n%s %13s %3d\n","successful steps:"," ",nok);
	printf("%s %20s %3d\n","bad steps:"," ",nbad);
	printf("%s %9s %3d\n","function evaluations:"," ",nrhs);
	printf("\n%s %3d\n","stored intermediate values:    ",kount);
	FILE *fp = fopen(FILENAME, "w");
	for (i=1;i<=kount;i++)
		fprintf(fp, "%10.4f %16.6f %16.6f %16.6f\n",
			        xp[i],yp[1][i],yp[2][i],yp[3][i]);
	fclose(fp);
	free_matrix(yp,1,3,1,300);
	free_vector(xp,1,300);
	free_vector(ystart,1,K);
	return 0;
}
#undef NRANSI
