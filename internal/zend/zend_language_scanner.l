package main

import (
	"fmt"
)

//STATE
const (
	yyc_INITIAL = 0
	yyc_ST_IN_SCRIPTING = 1
)

//TOKEN
const (
	T_EXIT = iota
	T_OPEN_TAG = iota
	T_CLOSE_TAG = iota
	T_ECHO = iota
)



func main(){
	input := "<?php echo '123'; exit;?>\n"
	lex_scan(input)
}

func YYDEBUG(s int64, c byte){
	fmt.Println(s,c)
}

func SCNG(yyvar interface{}) int64{
	fmt.Println(yyvar)
	return 0
}

func lex_scan(zendlval string) int64 {

var token uint64
var offset uint64

var yyleng uint64
YYCURSOR := &LanguageScannerGlobals.YYCursor
YYSTATE := &LanguageScannerGlobals.YYState

/*!re2c
re2c:yyfill:check = 0;
re2c:yyfill:enable = 0;
re2c:define:YYCTYPE = byte;
re2c:define:YYPEEK = "zendlval[*YYCURSOR]\n fmt.Println(*YYCURSOR,FileLine(),yych,string(yych))";
re2c:define:YYGETCONDITION = "*YYSTATE";
re2c:define:YYSKIP = "*YYCURSOR += 1";

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
/* <!*> := yyleng = YYCURSOR - LanguageScannerGlobals.YYText */


<ST_IN_SCRIPTING> "exit" {
	fmt.Println("exit")
	fmt.Println(token,offset,yyleng,*YYCURSOR)
	return  T_EXIT;
}

<ST_IN_SCRIPTING> "echo" {
	fmt.Println("echo")
	fmt.Println(token,offset,yyleng,*YYCURSOR)
	return  T_ECHO;
}


<INITIAL> "<?php" {
	BEGIN(yyc_ST_IN_SCRIPTING)
	fmt.Println("<?php")
	fmt.Println(token,offset,yyleng,*YYCURSOR)
	return  T_OPEN_TAG;
}

<ST_IN_SCRIPTING>"?>"{NEWLINE}? {
	BEGIN(yyc_INITIAL);
	fmt.Println(yyleng,*YYCURSOR)
	fmt.Println("?>")
	return T_CLOSE_TAG;
}

*/
}