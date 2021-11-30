#ifndef BRIDGE_H
#define BRIDGE_H

#ifdef __cplusplus
extern "C" {
#endif

void* FooNew(int value);
void FooDestroy(void* foo);
int FooGet(void* foo);
void FooSet(void* foo, int value);

#ifdef __cplusplus
}
#endif

#endif
