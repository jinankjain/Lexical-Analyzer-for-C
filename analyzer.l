%{
#include <math.h>	// to use atof() 
%}

letter      [a-zA-Z]
digit       [0-9]
newline     (\n)
ws          [ \t]+
string      \"[^"\n]*\"
exponent    ((E|e)("+"|"-")?({digit}+))
float1      {digit}+"."{digit}+{exponent}?
float2      {digit}+{exponent}
double      ({float1}|{float2})
integer     {digit}+
identifier  ({letter}|"_")({letter}|{digit}|"_")* 	

%%
"//"((.)*)\n 							printf("LineComment\n");
"/*"(([^*]|(("*"+)[^*/]))*)("*"+)"/"\n 	printf("MultilineComment\n");

{newline}		{ printf("\n"); }
{integer}		{ printf("integer"); }
{double}		{ printf("double"); }
{string}		{ printf("string"); }
{identifier} 	{ printf("id"); }
{ws}			{; }
. 				{; }

%%

int yywrap(void) {
	return 1;
}

int main(void) {
	yylex();
	return 0;
}