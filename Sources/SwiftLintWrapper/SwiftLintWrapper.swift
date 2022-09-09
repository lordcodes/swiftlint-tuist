// Copyright © 2022 Andrew Lord.

public enum SwiftLintWrapper {
    public static func run(with arguments: [String]) {
        SwiftLint.main(arguments)
    }
}
