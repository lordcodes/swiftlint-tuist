// Copyright © 2022 Andrew Lord.

import Darwin
import Foundation
import SwiftFormat

struct SwiftFormatCommand {
    let arguments: [String]
    let lint: Bool

    func run() {
        let printQueue = DispatchQueue(label: "swiftformat.print")
        var stderr = FileHandle.standardError
        let stderrIsTty = isatty(STDERR_FILENO) != 0
        CLI.print = { message, type in
            printQueue.sync {
                switch type {
                case .info:
                    print(message, to: &stderr)
                case .success:
                    print(stderrIsTty ? message.inGreen : message, to: &stderr)
                case .error:
                    print(stderrIsTty ? message.inRed : message, to: &stderr)
                case .warning:
                    print(stderrIsTty ? message.inYellow : message, to: &stderr)
                case .content:
                    print(message)
                case .raw:
                    print(message, terminator: "")
                }
            }
        }

        let exitCode = CLI.run(
            in: FileManager.default.currentDirectoryPath,
            with: cliArguments()
        )
        exit(exitCode.rawValue)
    }

    private func cliArguments() -> [String] {
        var outputArguments = arguments.filter { $0 != "--lint" }
        if lint {
            outputArguments += ["--lint"]
        }
        if outputArguments.allSatisfy({ $0.starts(with: "--") || $0.starts(with: "-") }) {
            outputArguments = [FileManager.default.currentDirectoryPath] + outputArguments
        }
        let arguments = [programName] + outputArguments
        if !arguments.contains(where: { $0 == "-q" || $0 == "--quiet" }) {
            print("Running SwiftFormat with arguments: \(arguments)")
        }
        return arguments
    }

    static func currentVersion() -> String {
        version
    }
}

private extension String {
    var inDefault: String { return "\u{001B}[39m\(self)" }
    var inRed: String { return "\u{001B}[31m\(self)\u{001B}[0m" }
    var inGreen: String { return "\u{001B}[32m\(self)\u{001B}[0m" }
    var inYellow: String { return "\u{001B}[33m\(self)\u{001B}[0m" }
}

extension FileHandle: TextOutputStream {
    public func write(_ string: String) {
        write(Data(string.utf8))
    }
}
