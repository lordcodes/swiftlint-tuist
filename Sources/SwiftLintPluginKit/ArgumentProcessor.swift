// Copyright © 2022 Andrew Lord.

import Foundation

public enum ArgumentProcessor {
    public static func parse(arguments: [String]) -> CommandArguments {
        let programName = arguments.first ?? "tuist-swiftlint"
        let remainingArguments = Array(arguments.dropFirst())

        let subcommand: String
        let outputArguments: [String]
        if let first = remainingArguments.first, ArgumentProcessor.validSubcommands.contains(first) {
            subcommand = remainingArguments.first ?? "lint"
            outputArguments = Array(remainingArguments.dropFirst())
        } else {
            subcommand = "lint"
            outputArguments = remainingArguments
        }
        return CommandArguments(programName: programName, subcommand: subcommand, arguments: outputArguments)
    }

    static func swiftLintArguments(fix: Bool, command: CommandArguments) -> [String] {
        let commandArguments = command.arguments.filter { $0 != "--fix" }
        var outputArguments = [String]()
        if fix {
            outputArguments.append("--fix")
        }
        outputArguments.append(contentsOf: commandArguments)
        return outputArguments
    }

    private static let validSubcommands: [String] = ["fix", "help", "lint", "version"]
}
