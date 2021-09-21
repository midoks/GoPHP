#!/bin/sh


#re2go -i --no-generation-date --case-inverted -cbdF -o z.go z.l


re2go -i --no-generation-date --case-inverted -cbF -o zend_language_scanner.go zend_language_scanner.l



goyacc  -o zend_language_parser.go -v zend_language_parser.output zend_language_parser.y

go run  zend_language_scanner.go zend_globals.go