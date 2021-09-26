// Code generated by golex. DO NOT EDIT.

package main

import (
	"bufio"
	"fmt"
	"log"
	"os"
	//"strings"
)

//TOKEN
const (
	T_EXIT      = iota
	T_OPEN_TAG  = iota
	T_CLOSE_TAG = iota
	T_ECHO      = iota
	T_END       = iota
)

var (
	src     = bufio.NewReader(os.Stdin)
	buf     []byte
	current byte
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
	// input := "<?php echo '123'; exit; ?>\n"
	// src := strings.NewReader(input)
	lex_scan()
}

func lex_scan() { // This left brace is closed by *1
	c := getc() // init

yystate0:

	goto yystart1

yystate1:
	c = getc()
yystart1:
	switch {
	default:
		goto yystate3 // c >= '\x01' && c <= '\b' || c == '\v' || c == '\f' || c >= '\x0e' && c <= '\x1f' || c >= '!' && c <= '-' || c == '/' || c == ':' || c == ';' || c >= '=' && c <= 'ÿ'
	case c == '.':
		goto yystate6
	case c == '<':
		goto yystate10
	case c == '\n':
		goto yystate5
	case c == '\t' || c == '\r' || c == ' ':
		goto yystate4
	case c == '\x00':
		goto yystate2
	case c >= '0' && c <= '9':
		goto yystate8
	}

yystate2:
	c = getc()
	goto yyrule5

yystate3:
	c = getc()
	goto yyrule6

yystate4:
	c = getc()
	switch {
	default:
		goto yyrule2
	case c == '\t' || c == '\n' || c == '\r' || c == ' ':
		goto yystate5
	}

yystate5:
	c = getc()
	switch {
	default:
		goto yyrule2
	case c == '\t' || c == '\n' || c == '\r' || c == ' ':
		goto yystate5
	}

yystate6:
	c = getc()
	switch {
	default:
		goto yyrule6
	case c >= '0' && c <= '9':
		goto yystate7
	}

yystate7:
	c = getc()
	switch {
	default:
		goto yyrule4
	case c >= '0' && c <= '9':
		goto yystate7
	}

yystate8:
	c = getc()
	switch {
	default:
		goto yyrule3
	case c == '.':
		goto yystate7
	case c >= '0' && c <= '9':
		goto yystate9
	}

yystate9:
	c = getc()
	switch {
	default:
		goto yyrule3
	case c == '.':
		goto yystate7
	case c >= '0' && c <= '9':
		goto yystate9
	}

yystate10:
	c = getc()
	switch {
	default:
		goto yyrule6
	case c == '?':
		goto yystate11
	}

yystate11:
	c = getc()
	switch {
	default:
		goto yyabort
	case c == 'p':
		goto yystate12
	}

yystate12:
	c = getc()
	switch {
	default:
		goto yyabort
	case c == 'h':
		goto yystate13
	}

yystate13:
	c = getc()
	switch {
	default:
		goto yyabort
	case c == 'p':
		goto yystate14
	}

yystate14:
	c = getc()
	goto yyrule1

yyrule1: // "<?php"
	{
		{
			fmt.Printf("LABEL %q\n", buf)
		}
		goto yystate0
	}
yyrule2: // [ \t\n\r]+
	{
		// Ignore whitespace
		goto yystate0
	}
yyrule3: // {D}
	{
		fmt.Printf("int %q\n", buf)
		goto yystate0
	}
yyrule4: // {D}\.{D}?|\.{D}
	{
		fmt.Printf("float %q\n", buf)
		goto yystate0
	}
yyrule5: // \0
	{
		return // Exit on EOF or any other error
	}
yyrule6: // .
	if true { // avoid go vet determining the below panic will not be reached
		fmt.Printf("%q\n", buf) // Printout any other unrecognized stuff
		goto yystate0
	}
	panic("unreachable")

yyabort: // no lexem recognized
	//
	// silence unused label errors for build and satisfy go vet reachability analysis
	//
	{
		if false {
			goto yyabort
		}
		if false {
			goto yystate0
		}
		if false {
			goto yystate1
		}
	}

	// The rendered scanner enters top of the user code section when
	// lexem recognition fails. In this example it should never happen.
	log.Fatal("scanner internal error")

} // *1 this right brace
