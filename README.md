# SwiftMacroRepro

Context: https://forums.swift.org/t/how-to-import-macros-using-methods-other-than-swiftpm/66645/19

## Repro steps

### Part A (Macro Plugin)
1. Open swift-macro-examples-main/MacroExamples.xcodeproj.
2. Build the MacroExamples scheme.
3. Once the build is completed, go to the build details page and find the compiler invocation for main.swift.
4. Find the plugin executable path. `-load-executable-path`

```
-load-plugin-executable
/Users/chirag.ramani/Library/Developer/Xcode/DerivedData/swift-macro-examples-main-csywlwgecxhauhdfxsutsqgbukkc/Build/Products/Debug/MacroExamplesPlugin\#MacroExamplesPlugin
```
5. Find the path to MacroExamplesLib.swiftmodule from the same details page.

It will look something like this:
```
/Users/chirag.ramani/Library/Developer/Xcode/DerivedData/swift-macro-examples-main-csywlwgecxhauhdfxsutsqgbukkc/Build/Intermediates.noindex/MacroExamples.build/Debug/MacroExamplesLib.build/Objects-normal/arm64/MacroExamplesLib.swiftmodule
```

2. Open the MacroClient project and update the OTHER SWIFT FLAGS as follows:

### Part B (Macro Client)

1. Open MacroClient/MacroClient.xcodeproj.
2. Update the OTHER SWIFT FLAGS as follows:

```
-I<absolute path to MacroExamplesLib.swiftmodule>
```

```
-load-plugin-executable
/Users/chirag.ramani/Library/Developer/Xcode/DerivedData/swift-macro-examples-main-csywlwgecxhauhdfxsutsqgbukkc/Build/Products/Debug/MacroExamplesPlugin\#MacroExamplesPlugin
```

3. Build the project. 
Note: I have seen indexing not picking up the latest modification to OTHER SWIFT FLAGS. So kill XCBuildService, Xcode, and re-open MacroClient project.

**Observations:**
1. Everything builds fine, lldb prints macro results as expected.
2. Indexing is successful (as per indexing logs).
3. Macro - open definition works all fine as well. It opens the public interface of `MacroExamplesLib`.

**Issues:**
1. Syntax highlight for #stringify is not present.
2. `Expand Macro` option is not shown but the `Inline Macro` option is shown(and works as expected).
