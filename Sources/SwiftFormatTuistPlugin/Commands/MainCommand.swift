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
        case nil, "format":
            runSwiftFormat(lint: false)
        case "help":
            printHelp()
        case "lint":
            runSwiftFormat(lint: true)
        case "version":
            VersionCommand(arguments: arguments).run()
        default:
            runSwiftFormat(lint: false)
        }
    }

    private func runSwiftFormat(lint: Bool) {
        SwiftFormatCommand(arguments: arguments, lint: lint).run()
    }

    private func printHelp() {
        let help = """
        USAGE: tuist format [<subcommand>]

        DEFAULT SUBCOMMAND
          Run SwiftFormat in format mode.

        SUBCOMMANDS:
          format            Run SwiftFormat in format mode.
          lint              Run SwiftFormat in lint mode.
          help              Print this help information.
          version           Print SwiftFormat Tuist version.

        See 'tuist format <subcommand> --help' for detailed help.

        """
        print(help)
    }

    private static let validSubcommands: [String] = ["format", "help", "lint", "version"]
}
