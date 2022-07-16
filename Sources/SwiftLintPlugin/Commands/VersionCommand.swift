// Copyright © 2022 Andrew Lord.

import SwiftLintPluginKit

struct VersionCommand {
    let command: CommandArguments

    func run() {
        if command.arguments.contains(where: { $0 == "-h" || $0 == "--help" }) {
            printHelp()
        } else {
            printVersion()
        }
    }

    private func printVersion() {
        print(PluginVersion.current)
    }

    private func printHelp() {
        let help = """
        OVERVIEW: Print version

        USAGE: \(command.programName) version

        OPTIONS:
          -h, --help              Show help information.

        """
        print(help)
    }
}
