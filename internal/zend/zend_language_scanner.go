// Code generated by re2c 2.2, DO NOT EDIT.
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

func YYDEBUG(s uint64, c byte){
	fmt.Println(s,string(c))
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


{
	var yych byte
	if (*YYSTATE < 1) {
		goto yyc_ST_IN_SCRIPTING
	} else {
		goto yyc_INITIAL
	}
/* *********************************** */
yyc_ST_IN_SCRIPTING:
	yych = zendlval[*YYCURSOR]
 YYDEBUG(*YYCURSOR, yych)
	if (yych <= 'D') {
		if (yych == '?') {
			goto yy3
		}
	} else {
		if (yych <= 'E') {
			goto yy4
		}
		if (yych == 'e') {
			goto yy4
		}
	}
yy2:
yy3:
	*YYCURSOR += 1
	yych = zendlval[*YYCURSOR]
 YYDEBUG(*YYCURSOR, yych)
	if (yych == '>') {
		goto yy5
	}
	goto yy2
yy4:
	*YYCURSOR += 1
	yych = zendlval[*YYCURSOR]
 YYDEBUG(*YYCURSOR, yych)
	if (yych <= 'X') {
		if (yych == 'C') {
			goto yy7
		}
		if (yych <= 'W') {
			goto yy2
		}
		goto yy8
	} else {
		if (yych <= 'c') {
			if (yych <= 'b') {
				goto yy2
			}
			goto yy7
		} else {
			if (yych == 'x') {
				goto yy8
			}
			goto yy2
		}
	}
yy5:
	*YYCURSOR += 1
	yych = zendlval[*YYCURSOR]
 YYDEBUG(*YYCURSOR, yych)
	if (yych == '\n') {
		goto yy9
	}
	if (yych == '\r') {
		goto yy10
	}
yy6:
	{
	BEGIN(yyc_INITIAL);
	fmt.Println(yyleng,*YYCURSOR)
	fmt.Println("?>")
	return T_CLOSE_TAG;
}
yy7:
	*YYCURSOR += 1
	yych = zendlval[*YYCURSOR]
 YYDEBUG(*YYCURSOR, yych)
	if (yych == 'H') {
		goto yy11
	}
	if (yych == 'h') {
		goto yy11
	}
	goto yy2
yy8:
	*YYCURSOR += 1
	yych = zendlval[*YYCURSOR]
 YYDEBUG(*YYCURSOR, yych)
	if (yych == 'I') {
		goto yy12
	}
	if (yych == 'i') {
		goto yy12
	}
	goto yy2
yy9:
	*YYCURSOR += 1
	goto yy6
yy10:
	*YYCURSOR += 1
	yych = zendlval[*YYCURSOR]
 YYDEBUG(*YYCURSOR, yych)
	if (yych == '\n') {
		goto yy9
	}
	goto yy6
yy11:
	*YYCURSOR += 1
	yych = zendlval[*YYCURSOR]
 YYDEBUG(*YYCURSOR, yych)
	if (yych == 'O') {
		goto yy13
	}
	if (yych == 'o') {
		goto yy13
	}
	goto yy2
yy12:
	*YYCURSOR += 1
	yych = zendlval[*YYCURSOR]
 YYDEBUG(*YYCURSOR, yych)
	if (yych == 'T') {
		goto yy15
	}
	if (yych == 't') {
		goto yy15
	}
	goto yy2
yy13:
	*YYCURSOR += 1
	{
	fmt.Println("echo")
	fmt.Println(token,offset,yyleng,*YYCURSOR)
	return  T_ECHO;
}
yy15:
	*YYCURSOR += 1
	{
	fmt.Println("exit")
	fmt.Println(token,offset,yyleng,*YYCURSOR)
	return  T_EXIT;
}
/* *********************************** */
yyc_INITIAL:
	yych = zendlval[*YYCURSOR]
 YYDEBUG(*YYCURSOR, yych)
	if (yych == '<') {
		goto yy20
	}
yy19:
yy20:
	*YYCURSOR += 1
	yych = zendlval[*YYCURSOR]
 YYDEBUG(*YYCURSOR, yych)
	if (yych != '?') {
		goto yy19
	}
	*YYCURSOR += 1
	yych = zendlval[*YYCURSOR]
 YYDEBUG(*YYCURSOR, yych)
	if (yych == 'P') {
		goto yy22
	}
	if (yych != 'p') {
		goto yy19
	}
yy22:
	*YYCURSOR += 1
	yych = zendlval[*YYCURSOR]
 YYDEBUG(*YYCURSOR, yych)
	if (yych == 'H') {
		goto yy23
	}
	if (yych != 'h') {
		goto yy19
	}
yy23:
	*YYCURSOR += 1
	yych = zendlval[*YYCURSOR]
 YYDEBUG(*YYCURSOR, yych)
	if (yych == 'P') {
		goto yy24
	}
	if (yych != 'p') {
		goto yy19
	}
yy24:
	*YYCURSOR += 1
	{
	BEGIN(yyc_ST_IN_SCRIPTING)
	fmt.Println("<?php")
	fmt.Println(token,offset,yyleng,*YYCURSOR)
	return  T_OPEN_TAG;
}
}

}