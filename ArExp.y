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
exp:	exp op exp	{$$=f($1, $2, $3); printf($$);}
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

float f(float a, char op, float b){
	switch(op){
		case '+': return a+b; break;
		case '-': return a-b; break;
		case '*': return a*b; break;
		case '/': return a/b; break;
		default: printf("Error!!"); return 0;
		}
}




