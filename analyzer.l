%{
#include <math.h>   // to use atof() 
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
"//"((.)*)\n                            printf("LineComment\n");
"/*"(([^*]|(("*"+)[^*/]))*)("*"+)"/"\n  printf("MultilineComment\n");

bool        { printf("%s ", yytext); } 
break       { printf("%s ", yytext); }
class       { printf("%s ", yytext); } 
double      { printf("%s ", yytext); }
else        { printf("%s ", yytext); } 
extends     { printf("%s ", yytext); } 
for         { printf("%s ", yytext); } 
if          { printf("%s ", yytext); }
implements  { printf("%s ", yytext); } 
int         { printf("%s ", yytext); } 
interface   { printf("%s ", yytext); } 
newarray    { printf("%s ", yytext); } 
println     { printf("%s ", yytext); } 
readln      { printf("%s ", yytext); }
return      { printf("%s ", yytext); }
string      { printf("%s ", yytext); }
void        { printf("%s ", yytext); } 
while       { printf("%s ", yytext); }

true|false  { printf("boolconstant ");} 

"+"         { printf("plus "); }
"-"         { printf("minus "); }
"*"         { printf("multiplication "); }
"/"         { printf("division "); }
"<="        { printf("lessequal "); }
"<"         { printf("less "); }
">"         { printf("greater "); }
">="        { printf("greaterequal "); }
"=="        { printf("equal "); }
"!="        { printf("notequal "); }
"="         { printf("assignop "); }
";"         { printf("semicolon "); }
","         { printf("comma "); }
"."         { printf("period "); }
"("         { printf("leftparen "); }
")"         { printf("rightparen "); }
"["         { printf("leftbracket "); }
"]"         { printf("rightbracket "); }
"{"         { printf("leftbrace "); }
"}"         { printf("rightbrace "); }

{newline}       { printf("\n"); }
{integer}       { printf("integer "); }
{double}        { printf("double "); }
{string}        { printf("string "); }
{identifier}    { printf("id "); }
{ws}            {; }
.               {; }

%%

int yywrap(void) {
    return 1;
}

int main(void) {
    yylex();
    return 0;
}