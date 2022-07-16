// Copyright © 2022 Andrew Lord.

/// Configuration of the SwiftLintPluginKit framework.
public class SwiftLintPluginKit {
    /// Shared SwiftLintPluginKit instance.
    public static let shared = SwiftLintPluginKit()

    /// Control outputting of messages and errors, by default does nothing.
    ///
    /// There is a `ConsolePrinter` to print to console for CLI tools.
    public var printer: Printer = NoPrinter()
}

var printer: Printer {
    SwiftLintPluginKit.shared.printer
}
