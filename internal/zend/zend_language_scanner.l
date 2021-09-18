package main

import (
	"fmt"
)

//STATE
const (
	ST_IN_SCRIPTING = iota
)

//TOKEN
const (
	T_EXIT = iota
)

func main(){
	lex_scan("<?php exit;?>")
}

func YYDEBUG(s int64, c byte){
	fmt.Println(s,c)
}

func lex_scan(zendlval string){

var token int
var offset int
var cursor int
count := 0

restart:
	SCNG(yy_text) = YYCURSOR;

/*!re2c
re2c:yyfill:check = 0;
re2c:yyfill:enable = 0;
re2c:define:YYCTYPE = byte;
re2c:define:YYPEEK = "zendlval[cursor]";
re2c:define:YYSKIP = "cursor += 1";

LNUM	= [0-9]+("_"[0-9]+)*;
DNUM	= ({LNUM}?"."{LNUM})|({LNUM}"."{LNUM}?);
EXPONENT_DNUM = (({LNUM}|{DNUM})[eE][+-]?{LNUM});
HNUM	= "0x"[0-9a-fA-F]+("_"[0-9a-fA-F]+)*;
BNUM	= "0b"[01]+("_"[01]+)*;
LABEL = [a-zA-Z_\x80-\xff][a-zA-Z0-9_\x80-\xff]*;
WHITESPACE = [ \n\r\t]+;
TABS_AND_SPACES = [ \t]*;
TOKENS = [;:,.|^&+-/*=%!~$<>?@];
ANY_CHAR = [^];
NEWLINE = ("\r"|"\n"|"\r\n");

/* compute yyleng before each rule */
<!*> := yyleng = YYCURSOR - SCNG(yy_text);

<ST_IN_SCRIPTING> "exit" {
	fmt.Println(YYCURSOR)
	go restart
}
*/
}