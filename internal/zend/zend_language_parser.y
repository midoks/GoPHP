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
%token <id> ADD SUB '+' '-'

%type <id> expr

%start expr

%%

expr: NUM {$$ =$1}
	| expr '+' NUM {$$ = $1 + $3}
	| expr '-' NUM {$$ = $1 + $3}
;

%%