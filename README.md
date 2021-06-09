This project demonstrates a crash caused by broken Swift ABI.

Project contains three targets:

- LibAAA - Framework with a static library (MACH_O_TYPE = staticlib), it contains few enums
- LibAAA - Framework with a static library (MACH_O_TYPE = staticlib), it contains few enums and imports LibAAA
- LinkingDemo – Executable, it links LibAAA and LibBBB and uses an enum value with broken metadata.

The `LinkingDemo` executable crashes both on my Mac Mini M1 and on Mac Book Pro with Intel CPU.