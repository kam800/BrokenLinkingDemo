This project demonstrates a crash caused by broken Swift ABI.

Project contains three targets:

- LibAAA - Framework with a static library (MACH_O_TYPE = staticlib), it contains few enums
- LibBBB - Framework with a static library (MACH_O_TYPE = staticlib), it contains few enums and imports LibAAA
- LinkingDemo – Executable, it imports both LibAAA and LibBBB (but doesn't link them explicitly) and uses an enum value with broken metadata.

The `LinkingDemo` executable crashes both on my Mac Mini M1 and on Mac Book Pro with Intel CPU.
