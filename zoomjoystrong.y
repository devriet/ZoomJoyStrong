%{
/* 
 * Timothy D. DeVries
 * CIS 343
 * Prof. Ira Woodring
 * November 2017
 * This file parses tokens into commands for the graphics tool.
 */

#include <stdio.h>
#include "zoomjoystrong.h"


%}

%start stmt_list



%token RECTANGLE SET_COLOR CIRCLE LINE POINT INT FLOAT

%%

stmt_list:
	stmt
	|
	stmt stmt_list
	{
		//C code here
	}

stmt:	expr

expr:	point
	|
	circle
	|
	rectangle
	|
	line
	|
	int
	|
	float
	|
	set_color
	;

point:	POINT INT INT
	{ printf("got a point\n") };

circle:	CIRCLE INT INT INT
	{ printf("got a circle\n") };

rectangle:
	RECTANGLE INT INT INT INT
	{ printf("got a rectangle\n") };

line:	LINE INT INT INT INT
	{ printf("got a line\n") };

int:	INT
	{ printf("got an int\n") };

float:	FLOAT
	{ printf("got a float\n") };

set_color:
	SET_COLOR INT INT INT
	{ printf("got a color\n") };

%%


main()
{
	return(yyparse());
}

yyerror(s)
char *s;
{
	fprintf(stderr, "%s\n",s);
}

yywrap()
{
	return(1);
}




