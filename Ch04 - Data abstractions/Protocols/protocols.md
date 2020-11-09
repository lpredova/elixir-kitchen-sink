# Protocols

A protocol is a module in which you declare functions without implementing them.

The generic logic relies on the protocol and calls its functions. Then you can provide a concrete implementation of the protocol for different data types.



Due to its inner workings, a protocol dispatch may in some cases be significantly slower than a direct function call


## Access protocol
The Access protocol makes it possible to directly retrieve a value from the data structure

Enables put_in, get_in, [] syntax.

## Enumerable protocol

## Collectable protocol
