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

%type <val> exp goal term fact
%%
goal:	exp		{$$=$1;};
exp:	term MAS exp	{$$=$1 + $3;}
	|term MENOS exp	{$$=$1 - $3;}
	|term		{$$=$1;};
term:	fact POR term	{$$=$1 * $3;}
	|fact ENTRE term{$$=$1 / $3;}
	|fact		{$$=$1;};
fact:	NUM		{$$=$1;};

%%

int main() {
	printf(">> ");
	yyparse();
	return 0;
}





