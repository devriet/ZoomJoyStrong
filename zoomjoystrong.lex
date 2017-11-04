%{
/* 
 * Timothy D. DeVries
 * CIS 343
 * Prof. Ira Woodring
 * November 2017
 * This is a tokenizer for a graphics tool used to draw shapes and lines.
 */

#include <stdio.h>
#include "zoomjoystrong.tab.h"

%}

%%

" "	;
";"	;
rectangle	{ return(RECTANGLE); }

set_color	{ return(SET_COLOR); }

circle		{ return(CIRCLE); }

line		{ return(LINE); }

point		{ return(POINT); }

[0-9]+"."[0-9]*	{ yylval.fval = atof(yytext);
		return(FLOAT); }

[0-9]+		{ yylval.ival = atoi(yytext);
		return(INT); }

%%
