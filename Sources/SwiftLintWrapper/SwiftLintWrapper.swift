// Copyright © 2022 Andrew Lord.

import ArgumentParser
import Foundation

public enum SwiftLintWrapper {
    public static func run(with arguments: [String]) async {
        await SwiftLint.main(with: arguments)
    }
}

extension AsyncParsableCommand {
    public static func main(with arguments: [String]) async {
        do {
            var command = try parseAsRoot(arguments)
            if var asyncCommand = command as? AsyncParsableCommand {
                try await asyncCommand.run()
            } else {
                try command.run()
            }
        } catch {
            exit(withError: error)
        }
    }
}
