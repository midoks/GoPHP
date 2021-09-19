package main

type ZendPhpScannerGlobals struct {
	YYLeng uint32

	YYStart  uint64
	YYCursor uint64
	YYMarker uint64
	YYText   uint64

	YYState int32
}

var LanguageScannerGlobals ZendPhpScannerGlobals

func BEGIN(_state int32) {
	LanguageScannerGlobals.YYState = _state
}
