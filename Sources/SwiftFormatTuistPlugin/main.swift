// Copyright © 2022 Andrew Lord.

let programName = CommandLine.arguments.first ?? "tuist-format"
let arguments = Array(CommandLine.arguments.dropFirst())
MainCommand(arguments: arguments).run()
