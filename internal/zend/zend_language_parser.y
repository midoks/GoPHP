%{
package main

import (
    "fmt"
)
%}


%union { 
value int64 
id string 
}


%token <value> NUM
%token <value> ADD SUB '+' '-'

%type <value> expr

%start expr

%%

expr: NUM {$$ =$1}
	| expr '+' NUM {$$ = $1 + $3}
	| expr '-' NUM {$$ = $1 + $3}
;

%%