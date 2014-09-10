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
[MAS]	{yyval.t; return MAS;}
[MENOS]	{yyval.t; return MENOS;}
[POR]	{yyval.t; return POR;}
[ENTRE]	{yyval.t; return ENTRE;}
[NUM]	{yylval.val; return NUM;}
%%

int main(int argc, char *argv[])
{
    yylex();
}


