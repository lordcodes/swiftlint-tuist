// Copyright © 2022 Andrew Lord.

import Darwin
import Foundation
import SwiftLintPluginKit

struct SwiftLintCommand {
    let command: CommandArguments
    let fix: Bool

    func run() {
        DispatchQueue.global().async {
            SwiftLintService(command: command, fix: fix).run()
            exit(EXIT_SUCCESS)
        }
        dispatchMain()
    }
}
