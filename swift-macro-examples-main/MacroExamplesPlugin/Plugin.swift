#if canImport(SwiftCompilerPlugin)
import SwiftCompilerPlugin
import SwiftSyntaxMacros

@main
struct MyPlugin: CompilerPlugin {
  let providingMacros: [Macro.Type] = [
    StringifyMacro.self,
//    AddBlocker.self,
//    WarningMacro.self,
//    FontLiteralMacro.self,
//    WrapStoredPropertiesMacro.self,
//    DictionaryStorageMacro.self,
////    AddCompletionHandlerMacro.self,
////    AddAsyncMacro.self,
//    CaseDetectionMacro.self,
//    MetaEnumMacro.self,
//    CodableKey.self,
////    CustomCodable.self,
//    URLMacro.self
  ]
}
#endif
