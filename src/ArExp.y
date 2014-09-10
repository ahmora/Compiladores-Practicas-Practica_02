%{
#include <stdio.h>
#include <stdlib.h>
int yylex(); 
int yyerror(const char *s) { printf ("Error: %s\n", s); }
%}

%union Data {
	int val;
	char t;
}

 
%token <val> NUM
%token <t> MAS MENOS POR ENTRE

%type <val> exp goal term fact
%%
goal:	exp			{$$=$1;printf("Goal\n");};
exp:	term MAS exp		{$$=$1 + $3; printf("La suma es %i\n",$$);}
	|term MENOS exp		{$$=$1 - $3; printf("La resta es %i\n",$$);}
	|term			{$$=$1;printf("Exp->Term\n");};
term:	fact POR term		{$$=$1 * $3; printf("La mult es %i\n",$$);}
	|fact ENTRE term	{$$=$1 / $3; printf("La div es %i\n",$$);}
	|fact			{$$=$1;printf("Term->Fact\n");};
fact:	NUM			{$$=$1;printf("El numero es: %i\n",$$);};

%%

int main() {
	printf(">> ");
	yyparse();
	return 0;
}





