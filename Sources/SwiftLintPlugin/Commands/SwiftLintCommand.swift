// Copyright © 2022 Andrew Lord.

import Darwin
import Foundation
import SwiftLintPluginKit

struct SwiftLintCommand {
    let command: CommandArguments
    let fix: Bool

    func run() async {
        await SwiftLintService(command: command, fix: fix).run()
    }
}
