package zend

import (
	"fmt"
)

type zend_long int64
type double float64

type zend_value struct {
	lval zend_long
	dval double
}

type zval struct {
	value zend_value
}
