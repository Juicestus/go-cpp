#include "library.hh"

Foo::Foo(int value) {
    this->value = value;
}

Foo::~Foo() {
}

int Foo::get() {
    return this->value;
}

void Foo::set(int value) {
    this->value = value;
}