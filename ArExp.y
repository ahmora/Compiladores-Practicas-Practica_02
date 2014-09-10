%{
#include <stdio.h>
#include <stdlib.h>

%}

%union Data {
	float val;
	char t;
}

 
%token <float> NUM
%token <t> MAS MENOS POR ENTRE

%type <val> exp goal
%type <t> op

%%
goal:	exp		{$$=$1;};
exp:	exp op exp	{$$=fun($1, $2, $3);}
	|NUM		{$$=$1;};
op:	MAS		{$$=$1;}
	|MENOS		{$$=$1;}
	|POR		{$$=$1;}
	|ENTRE		{$$=$1;};
%%

int main() {
	printf(">> ");
	yyparse();
	return 0;
}

float fun(float a, char op, float b){
	float f;
	switch(op){
		case '+': f=a+b;
			printf("%f\n",f);
			break;
		case '-': f=a+b;
			printf("%f\n",f);
			break;
		case '*': f=a+b;
			printf("%f\n",f);
			break;
		case '/': f=a+b;
			printf("%f\n",f);
			break;
		default: printf("Error!!"); 
			f=-1;
		}
		return f;
}




