// Copyright © 2022 Andrew Lord.

struct VersionCommand {
    let arguments: [String]

    func run() {
        if arguments.contains(where: { $0 == "-h" || $0 == "--help" }) {
            printHelp()
        } else {
            printVersion()
        }
    }

    private func printVersion() {
        print(Version.current)
    }

    private func printHelp() {
        let help = """
        OVERVIEW: Print version

        USAGE: \(programName) version

        OPTIONS:
          -h, --help              Show help information.

        """
        print(help)
    }
}
