// Copyright © 2022 Andrew Lord.

let programName = CommandLine.arguments.first ?? "tuist-swiftlint"
let arguments = Array(CommandLine.arguments.dropFirst())
MainCommand(arguments: arguments).run()
