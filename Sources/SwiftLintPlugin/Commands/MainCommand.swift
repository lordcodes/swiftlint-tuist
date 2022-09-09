// Copyright © 2022 Andrew Lord.

import SwiftLintPluginKit

struct MainCommand {
    let command: CommandArguments

    init(arguments: [String]) {
        command = ArgumentProcessor.parse(arguments: arguments)
    }

    func run() async {
        let isQuiet = command.arguments.contains { $0 == "--quiet" || $0 == "-q" }
        SwiftLintPluginKit.shared.printer = ConsolePrinter(quiet: isQuiet)

        switch command.subcommand {
        case "lint":
            await runSwiftLint(fix: false)
        case "fix":
            await runSwiftLint(fix: true)
        case "help":
            printHelp()
        case "version":
            VersionCommand(command: command).run()
        default:
            await runSwiftLint(fix: false)
        }
    }

    private func runSwiftLint(fix: Bool) async {
        await SwiftLintCommand(command: command, fix: fix).run()
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
}
