#include "library.hh"
#include "bridge.h"

Foo* to_foo(void* foo) {
    return reinterpret_cast<Foo*>(foo);
}

void* FooNew(int value) {
    auto foo = new Foo(value);
    return foo;
}

void FooDestroy(void* foo) {
    to_foo(foo)->~Foo();
}

int FooGet(void* foo) {
    return to_foo(foo)->get();
}

void FooSet(void* foo, int value) {
    to_foo(foo)->set(value);
}
