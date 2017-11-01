%{
/* 
 * Timothy D. DeVries
 * CIS 343
 * Prof. Ira Woodring
 * November 2017
 * This is a tokenizer for a graphics tool used to draw shapes and lines.
 */

#include <stdio.h>
#include "y.tab.h"

%}

%%

" "	;

'rectangle'	{ return(RECTANGLE); }

'set_color'	{ return(SET_COLOR); }

'circle'	{ return(CIRCLE); }

'line'		{ return(LINE); }

'point'		{ return(POINT); }

'int'		{ return(INT); }

'float'		{ return(FLOAT); }

%%
