// Copyright © 2022 Andrew Lord.

public struct CommandArguments: Equatable {
    public let programName: String
    public let subcommand: String
    public let arguments: [String]

    public init(programName: String, subcommand: String, arguments: [String]) {
        self.programName = programName
        self.subcommand = subcommand
        self.arguments = arguments
    }
}
