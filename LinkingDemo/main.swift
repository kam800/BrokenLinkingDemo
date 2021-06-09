import LibAAA
import LibBBB

/// Compiled executable breaks Swift ABI.
///
/// A symbols list snippet follows.
///   ```
///   $ nm -n
///   ...
///   000000010000c068 s _$s6LibAAA8EnumAAA0OWV
///   000000010000c0d8 s _$s6LibAAA8EnumAAA0OMf
///   000000010000c0e0 S _$s6LibAAA8EnumAAA0ON
///   000000010000c0f0 s _$s6LibAAA8EnumAAA1OWV
///   000000010000c160 s _$s6LibAAA8EnumAAA1OMf
///   000000010000c168 S _$s6LibAAA8EnumAAA1ON
///   000000010000c178 s _$s6LibAAA8EnumAAA2OWV
///   000000010000c1e8 s _$s6LibAAA8EnumAAA2OMf
///   000000010000c1f0 s _$s6LibBBB8EnumBBB0OWV
///   000000010000c260 S _$s6LibAAA8EnumAAA2ON
///   000000010000c270 s _$s6LibAAA8EnumAAA3OWV
///   000000010000c2e0 s _$s6LibBBB8EnumBBB0OMf
///   000000010000c2e8 S _$s6LibBBB8EnumBBB0ON
///   000000010000c2f8 s _$s6LibAAA8EnumAAA3OMf
///   000000010000c300 s _$s6LibBBB8EnumBBB1OWV
///   000000010000c370 S _$s6LibAAA8EnumAAA3ON
///   000000010000c380 s _$s6LibAAA8EnumAAA4OWV
///   000000010000c3f0 s _$s6LibBBB8EnumBBB1OMf
///   000000010000c3f8 S _$s6LibBBB8EnumBBB1ON
///   ...
///   ```

print("Let's crash!")

let a = LibAAA.EnumAAA3.a
/// Following crashes in Version 12.5 (12E262)
/// On x86: broken ABI causes broken Stack Pointer. A `callq` instruction results in `EXC_BAD_INSTRUCTION`.
/// On ARM: broken ABI causes broken metadata pointer. `swift_retain` fails of getting ref count on broken pointer.
print(a)

public func useAAAModuleType(e: LibAAA.EnumAAA3) {
    print(e)
}

public func useBBBModuleType(e: LibBBB.EnumBBB3) {
    print(e)
}
