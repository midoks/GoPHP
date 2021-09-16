package zend

import (
	"fmt"
)


func lex_scan(zendlval Zval){
	var cursor int
	count := 0

restart:
	SCNG(yy_text) = YYCURSOR;

/*!re2c
re2c:yyfill:check = 0;
re2c:yyfill:enable = 0;
re2c:define:YYCTYPE = byte;
re2c:define:YYPEEK = "str[cursor]";
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
*      { return -1 }
[\x00] { return count }
[a-z]+ { count += 1; goto loop }
[ ]+   { goto restart }

/* compute yyleng before each rule */
<!*> := yyleng = YYCURSOR - SCNG(yy_text);

<ST_IN_SCRIPTING> "exit" {
	RETURN_TOKEN_WITH_IDENT(T_EXIT);
}
*/
}