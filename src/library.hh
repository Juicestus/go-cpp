#ifndef LIBRARY_HH
#define LIBRARY_HH

class Foo {
private:
    int value;

public:
    Foo(int value);
    ~Foo();
    int get();
    void set(int value);
};

#endif