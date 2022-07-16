// Copyright © 2022 Andrew Lord.

import Darwin
import Foundation
import SwiftLintWrapper

struct SwiftLintCommand {
    let arguments: [String]
    let fix: Bool

    func run() {
        DispatchQueue.global().async {
            SwiftLintWrapper.run(with: swiftLintArguments())
            exit(EXIT_SUCCESS)
        }
        dispatchMain()
    }

    private func swiftLintArguments() -> [String] {
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
