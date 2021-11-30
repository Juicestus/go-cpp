# GO-CPP

Examples of utilizing C++ code in GO. The process involves wrapping the library in a C bridge and compiling to a shared library. Then using CGO to link the C/C++ binaries with the GO binaries, and to include the C bridge headers. Finally, GO struct and function pointer interface code is built around the C bridge to reconstruct the class.
