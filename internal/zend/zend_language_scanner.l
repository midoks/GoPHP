package main

import (
	"fmt"
)

//STATE
const (
	yyc_INITIAL = iota
	yyc_ST_IN_SCRIPTING
)
//TOKEN
const (
	T_EXIT = iota
	T_OPEN_TAG
	T_CLOSE_TAG
	T_ECHO
)



func main(){
	input := "<?php echo '123'; exit;?>\n"
	for{
		token := lex_scan(input)
		fmt.Println("token:",token)
		if token == T_END {
			break
		}
	}
}

func YYDEBUG(s uint64, c byte){
	fmt.Println(s,string(c))
}

func SCNG(yyvar interface{}) int64{
	fmt.Println(yyvar)
	return 0
}

func lex_scan(zendlval string) int64 {

var token int64
var offset uint64

var yyleng uint64
YYCursor := &LanguageScannerGlobals.YYCursor
YYState := &LanguageScannerGlobals.YYState
YYText := &LanguageScannerGlobals.YYText

fmt.Println("YYState[yyc_ST_IN_SCRIPTING]:", yyc_ST_IN_SCRIPTING)
fmt.Println("YYState[yyc_INITIAL]:", yyc_INITIAL)

/*
restart:
	fmt.Println("restart:",*YYCursor,LanguageScannerGlobals.YYState)
*/

/*!re2c
re2c:yyfill:check = 0;
re2c:yyfill:enable = 0;
re2c:define:YYCTYPE = byte;
re2c:define:YYPEEK = "zendlval[*YYCursor]\n\tYYDEBUG(*YYCursor, yych)";
re2c:define:YYGETCONDITION = "*YYState";
re2c:define:YYSKIP = "*YYCursor += 1";

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
<!*> := yyleng = *YYCursor - *YYText


<ST_IN_SCRIPTING>"exit"{
	token = T_EXIT
	fmt.Println("exit")
	fmt.Println(token,offset,yyleng,*YYCursor)
	
}

<ST_IN_SCRIPTING>"echo"{
	token = T_CLOSE_TAG
	fmt.Println(token,offset,yyleng,*YYCursor)
	fmt.Println("echo")
}


<INITIAL>"<?php"{
	*YYState = yyc_INITIAL
	token = T_OPEN_TAG
	fmt.Println(token,offset,yyleng,*YYCursor)
	fmt.Println("token:T_OPEN_TAG:<?php")
}

<ST_IN_SCRIPTING>"?>"{NEWLINE}?{
	*YYState = yyc_ST_IN_SCRIPTING
	token = T_CLOSE_TAG
	fmt.Println(yyleng,*YYCursor)
	fmt.Println("T_CLOSE_TAG - ?>")
	goto emit_token_with_ident
}

*/
emit_token_with_ident:
	return token;

return token
}