// Copyright © 2022 Andrew Lord.

import Foundation
import SwiftLintWrapper

public struct SwiftLintService {
    private let command: CommandArguments
    private let fix: Bool

    public init(
        command: CommandArguments,
        fix: Bool
    ) {
        self.command = command
        self.fix = fix
    }

    public func run() {
        let swiftLintArguments = ArgumentProcessor.swiftLintArguments(
            fix: fix,
            command: command
        )
        printer.printMessage("Running SwiftLint with arguments: \(swiftLintArguments)")
        SwiftLintWrapper.run(with: swiftLintArguments)
    }
}
