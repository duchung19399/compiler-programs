/* Declarations */
%{
	#include <stdio.h>  
	#include <string.h>
	#include <stdlib.h> 
	char string[200];
%}

/* Translation rules */
%%
[\n]		{fprintf(yyout, "%s\n", string); string[0] = '\0'; }
[ ]*		{fprintf(yyout, "%s", string); string[0] = '\0'; fprintf(yyout, "%s", " "); }
.			strcat(string, yytext);
<<EOF>>		{ fprintf(yyout, "%s", string); return 0; } 
%%

/* Auxiliary functions */
int main()
{
	extern FILE *yyin, *yyout;
	char filename[100]; 
	printf("Input File:  ");
	scanf("%s", filename);
	yyin = fopen(filename, "r");

	if (yyin == NULL){
		printf("Error open file %s\n", filename);
	    exit(0);
	}

	printf("Output file:  ");
	scanf("%s", filename);
	yyout = fopen(filename, "w");

	if (yyout == NULL){
		printf("Error open file %s\n", filename);
	    exit(1);
	}
	yylex();
}

int yywrap(void)
{
	return 1;
}