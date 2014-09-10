%{
#include <stdio.h>
#include <stdlib.h>
#include "ArExp_parser.h"

%}

%option noyywrap
%option outfile="ArExp_scanner.c"




MAS	"+"
MENOS	"-"
ENTRE	"/"
POR	"*"
NUM	[0-9]*
ENTER	"\n"
SALIDA	"salir"

%%
{MAS}		{return MAS;}
{MENOS}		{return MENOS;}
{POR}		{return POR;}
{ENTRE}		{return ENTRE;}
{NUM}		{yylval.val = atoi(yytext); return NUM;}
{ENTER}     	{return ENTER;}
{SALIDA}	{return SALIDA;}
%%



