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

int yylex();
int yyerror(char *s);
%}

%start stmt_list
%union {
	int ival;
	float fval;
}
%token RECTANGLE SET_COLOR CIRCLE LINE POINT
%token <ival> INT
%token <fval> FLOAT

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
	{ /*printf("got a point\n");
	printf("x: %d\ty: %d", $2, $3);*/
	point($2, $3); };

circle:	CIRCLE INT INT INT
	{ /*printf("got a circle\n");*/
	circle($2, $3, $4); };

rectangle:
	RECTANGLE INT INT INT INT
	{ /*printf("got a rectangle\n");*/
	rectangle($2, $3, $4, $5); };

line:	LINE INT INT INT INT
	{ /*printf("got a line\n");*/
	line($2, $3, $4, $5); };

int:	INT
	{ printf("got an int\n"); };

float:	FLOAT
	{ printf("got a float\n"); };

set_color:
	SET_COLOR INT INT INT
	{ /*printf("got a color\n");*/
	set_color($2, $3, $4); };

%%


int main() {
	setup();
	return(yyparse());
	//finish();
}

int yyerror(char *s) {
	fprintf(stderr, "%s\n",s);
}

int yywrap() {
	return(1);
}

