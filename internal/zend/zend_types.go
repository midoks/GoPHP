package zend

//http://golang.org/ref/spec#Struct_types
import ()

type ZendString struct {
	Gc  ZendRefcounted
	H   int64
	Len int64
}

type ZendArray struct {
	Gc               ZendRefcounted
	NTableMask       uint32
	NNumUsed         uint32
	NNumOfElements   uint32
	NTableSize       uint32
	NInternalPointer uint32
	NNextFreeElement int64
}

type ZendObject struct {
	Gc     ZendRefcounted
	Handle uint32
}

type ZendRefcounted struct {
	Refcount int32
	TypeInfo int32
}

type ZendValue struct {
	Lval    int64
	Dval    float
	Counted ZendRefcounted
	Str     ZendString
	Arr     ZendArray
}

type Zval struct {
	Value ZendValue
}
