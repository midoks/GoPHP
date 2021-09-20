package main

import (
	"fmt"
	"runtime"
)

type ZendPhpScannerGlobals struct {
	YYLeng uint32

	YYStart  uint64
	YYCursor uint64
	YYMarker uint64
	YYText   uint64

	YYState int32
}

var LanguageScannerGlobals ZendPhpScannerGlobals

func init() {
	LanguageScannerGlobals.YYCursor = 0
	LanguageScannerGlobals.YYState = 1
}

func BEGIN(_state int32) {
	LanguageScannerGlobals.YYState = _state
}

func FileLine() string {
	_, fileName, fileLine, ok := runtime.Caller(1)
	var s string
	if ok {
		s = fmt.Sprintf("%s:%d", fileName, fileLine)
	} else {
		s = ""
	}
	return s
}
