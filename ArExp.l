%{
#include <stdio.h>
#include <stdlib.h>
#include "ArExp.tab.h"

%}

%option noyywrap
%option outfile="practica2.c"

MAS 	"+"
MENOS	"-"
ENTRE	"/"
POR	"*"
NUM	[0-9]+[0-9]*

%%
[MAS]	{yylval.t; return MAS;}
[MENOS]	{yylval.t; return MENOS;}
[POR]	{yylval.t; return POR;}
[ENTRE]	{yylval.t; return ENTRE;}
[NUM]	{yylval.val; return NUM;}
%%

int main(int argc, char *argv[])
{
    yylex();
}


