/* Declarations */
%{
%}

letter 	[a-zA-Z]
digit 	[0-9]

/* [w-W][h-H][i-I][l-L][e-E] works too. */
while 	(?i:while)

from	(?i:from)
select	(?i:select)
id	{letter}({letter}|{digit})*

/* Translation rules */
%%
{while} 	{ printf("WHILE KEYWORD"); return (WHILE); }
{from} 		{ printf("FROM KEYWORD"); return (FROM); }
{select}	{ printf("SELECT KEYWORD"); return (SELECT); }
{id}		{ printf("ID"); yytext = lowercase(yytext); yylval = (int) installID(); return (ID); }	
%%

/* Auxiliary functions */
int installID(){

}
