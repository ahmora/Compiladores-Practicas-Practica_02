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

%%
{MAS}	{yylval.t; return MAS;}
{MENOS}	{yylval.t; return MENOS;}
{POR}	{yylval.t; return POR;}
{ENTRE}	{yylval.t; return ENTRE;}
{NUM}	{yylval.val = atoi(yytext); return NUM;}
"salir"	yyterminate();
%%



