#!/bin/sh


re2go -i --no-generation-date --case-inverted -cbdF -o zend_language_scanner.go zend_language_scanner.l


go run  zend_language_scanner.go