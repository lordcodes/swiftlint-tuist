// Copyright © 2022 Andrew Lord.

import Darwin
import Foundation

struct SwiftLintCommand {
    let arguments: [String]
    let fix: Bool

    func run() {
        DispatchQueue.global().async {
            SwiftLint.mainHandlingDeprecatedCommands(cliArguments())
            exit(EXIT_SUCCESS)
        }
        dispatchMain()
    }

    private func cliArguments() -> [String] {
        var outputArguments = arguments.filter { $0 != "--fix" }
        if fix {
            outputArguments = ["--fix"] + outputArguments
        }
        if !outputArguments.contains(where: { $0 == "-q" || $0 == "--quiet" }) {
            print("Running SwiftLint with arguments: \(outputArguments)")
        }
        return outputArguments
    }
}
