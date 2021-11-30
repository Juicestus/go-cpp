package main

// #cgo LDFLAGS: -L. -llibrary
// #include "src/bridge.h"
import "C"
import (
	"unsafe"
)

type Foo struct {
	ptr unsafe.Pointer
}

func NewFoo(value int) Foo {
	var foo Foo
	foo.ptr = C.FooNew(C.int(value))
	return foo
}

func (foo Foo) Free() {
	C.FooDestroy(foo.ptr)
}

func (foo Foo) get() int {
	return int(C.FooGet(foo.ptr))
}

func (foo Foo) set(value int) {
	C.FooSet(foo.ptr, C.int(value))
}


func main() {
	foo := NewFoo(42)
	println(foo.get())
	foo.set(43)
	println(foo.get())
	foo.Free()
}