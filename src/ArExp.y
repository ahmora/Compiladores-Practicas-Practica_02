%{
#include <stdio.h>
#include <stdlib.h>
int yylex(); 
int yyerror(const char *s) { printf ("Error: %s\n", s); }
int seguir=1;
%}


%union Data {
	float val;
	char t;
}

 
%token <val> NUM ENTER SALIDA
%token <t> MAS MENOS POR ENTRE 

%type <val> exp goal term fact
%%
input:	goal ENTER;
	| SALIDA		{seguir=0;};
goal:	exp			{$$=$1;printf("%f\n",$$);return 0;};
exp:	term MAS exp		{$$=$1 + $3;}
	|term MENOS exp		{$$=$1 - $3;}
	|term			{$$=$1;};
term:	fact POR term		{$$=$1 * $3;}
	|fact ENTRE term	{$$=$1 / $3;}
	|fact			{$$=$1;};
fact:	NUM			{$$=$1;};

%%

int main() {
	while(seguir){
		printf(">> ");
		yyparse();
	}
	return 0;
}





