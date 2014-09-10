%{
#include <stdio.h>
#include <stdlib.h>
#include "ArExp.tab.h"

%}

%option noyywrap
%option outfile="practica2.c"

MAS		"+"
MENOS	"-"
ENTRE	"/"
POR		"*"
NUM		[0-9]+

%%

{MAS}	{return MAS;}
{MENOS}	{return MENOS;}
{POR}	{return POR;}
{ENTRE}	{return ENTRE;}
{NUM}	{yylval.val = atoi(yytext); return NUM;}

%%