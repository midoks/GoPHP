%{
package main

import (
    "bufio"
    "fmt"
    "log"
    "os"
    "strings"
)

//TOKEN
const (
	T_EXIT = iota
	T_OPEN_TAG = iota
	T_CLOSE_TAG = iota
	T_ECHO = iota
	T_END = iota
)

var (
    #src      = bufio.NewReader(os.Stdin)
    buf      []byte
    current  byte
)

func getc() byte {
    if current != 0 {
        buf = append(buf, current)
    }
    current = 0
    if b, err := src.ReadByte(); err == nil {
        current = b
    }
    return current
}

func main() {
	input := "<?php echo '123'; exit; ?>\n"
	src := strings.NewReader(input)
	lex_scan()
}

//    %yyc is a "macro" to access the "current" character.
//
//    %yyn is a "macro" to move to the "next" character.
//
//    %yyb is a "macro" to return the beginning-of-line status (a bool typed value).
//        It is used for patterns like `^re`.
//        Example: %yyb prev == 0 || prev == '\n'
//
//    %yyt is a "macro" to return the top/current start condition (an int typed value).
//        It is used when there are patterns with conditions like `<cond>re`.
//        Example: %yyt startCond

func lex_scan() { // This left brace is closed by *1
    c := getc() // init
%}

%yyc c
%yyn c = getc()

D   [0-9]+
LNUM	 [0-9]+("_"[0-9]+)*
DNUM	({LNUM}?"."{LNUM})|({LNUM}"."{LNUM}?)
EXPONENT_DNUM	 (({LNUM}|{DNUM})[eE][+-]?{LNUM})
HNUM	 "0x"[0-9a-fA-F]+("_"[0-9a-fA-F]+)*
BNUM	"0b"[01]+("_"[01]+)*
LABEL 	[a-zA-Z_\x80-\xff][a-zA-Z0-9_\x80-\xff]*
WHITESPACE	[ \n\r\t]+
TABS_AND_SPACES		[ \t]*
TOKENS 		[;:,.|^&+-/*=%!~$<>?@]
ANY_CHAR  	[^]
NEWLINE  	("\r"|"\n"|"\r\n")

%%
	buf = buf[:0]   	// Code before the first rule is executed before every scan cycle (state 0 action)
[ \t\n\r]+          // Ignore whitespace
{D}                 fmt.Printf("int %q\n", buf)
{LABEL}             fmt.Printf("LABEL %q\n", buf)
{D}\.{D}?|\.{D}     fmt.Printf("float %q\n", buf)
\0                  return // Exit on EOF or any other error
.                   fmt.Printf("%q\n", buf) // Printout any other unrecognized stuff
%%
    // The rendered scanner enters top of the user code section when
    // lexem recognition fails. In this example it should never happen.
    log.Fatal("scanner internal error")

} // *1 this right brace