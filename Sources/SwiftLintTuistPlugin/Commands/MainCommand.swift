// Copyright © 2022 Andrew Lord.

struct MainCommand {
    let subcommand: String?
    let arguments: [String]

    init(arguments: [String]) {
        if MainCommand.validSubcommands.contains(arguments.first ?? "") {
            subcommand = arguments.first
            self.arguments = Array(arguments.dropFirst())
        } else {
            subcommand = nil
            self.arguments = arguments
        }
    }

    func run() {
        switch subcommand {
        case nil, "lint":
            runSwiftLint(fix: false)
        case "fix":
            runSwiftLint(fix: true)
        case "help":
            printHelp()
        case "version":
            VersionCommand(arguments: arguments).run()
        default:
            runSwiftLint(fix: false)
        }
    }

    private func runSwiftLint(fix: Bool) {
        SwiftLintCommand(arguments: arguments, fix: fix).run()
    }

    private func printHelp() {
        let help = """
        USAGE: tuist swiftlint [<subcommand>]

        DEFAULT SUBCOMMAND
          Run SwiftLint in default lint mode.

        SUBCOMMANDS:
          lint              Run SwiftLint in default lint mode.
          fix               Run SwiftLint in fix mode.
          help              Print this help information.
          version           Print SwiftFormat Tuist version.

        See 'tuist swiftlint <subcommand> --help' for detailed help.

        """
        print(help)
    }

    private static let validSubcommands: [String] = ["fix", "help", "lint", "version"]
}
