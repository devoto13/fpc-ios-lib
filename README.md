#  Pascal library used in iOS app

This project demonstrates that it is possible to cross-compile Pascal dynamic library and use it from the iOS application.

### Notes

- You will need to install two packages, which can be retrieved from https://www.freepascal.org/down/i386/macosx.html: fpc-3.2.0.intel-macosx.dmg and fpc-3.2.0.intel-macosx.cross.ios.dmg.
- Source code in foo.pas and foo.h is taken from: https://macpgmr.github.io/MacXPlatform/PascalDynLibs.html
- Library can be compiled for ARM64 (device) or x64 (simulator) using corresponding cross-compilers:  
  - Device: `ppca64 foo.pas -XR/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk -WP11.0 && install_name_tool -id @loader_path/Frameworks/libfoo.dylib libfoo.dylib`  
  - Simulator: `ppcx64 -Tiphonesim foo.pas -XR/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk -WP11.0 && install_name_tool -id @loader_path/Frameworks/libfoo.dylib libfoo.dylib`
  
  - `-WP11.0` is required to not get linking erros (as by default it tries to build for iOS 7.0 and some dependencies are missing) - https://lists.sonic.net/mailman/private/mac-pascal/2019-December/015522.html (requires registration)
  - `install_name_tool` usage is required, so exacutable looks for libary at the correct location during runtime (information on the topic is available at https://jyhong836.github.io/tech/2015/07/29/add-3rd-part-dynamic-library-dylib-to-xcode-target.html)
- Bridging header is required to be able to call dynamic library code from Swift: https://theswiftdev.com/how-to-call-c-code-from-swift/
- Make sure to copy dynamic libary to into application bundle (see Copy Files step in Build Phases settings)

### Further work

- Building Universal binary should be straight-forward, but was not attempted yet (commands are in https://macpgmr.github.io/MacXPlatform/PascalDynLibs.html)
- Library is compiled without Bitcode (feature which allows Apple to optimize binary apps and is required for dSYM generation). Some information: https://wiki.freepascal.org/LLVM
