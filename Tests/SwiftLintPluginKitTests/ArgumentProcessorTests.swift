// Copyright © 2022 Andrew Lord.

import Foundation
import XCTest

@testable import SwiftLintPluginKit

class ArgumentProcessorTests: XCTestCase {
    func test_parse_emptyArguments() {
        let command = ArgumentProcessor.parse(arguments: [])

        XCTAssertEqual(command, CommandArguments(programName: "tuist-swiftlint", subcommand: "lint", arguments: []))
    }

    func test_parse_programName() {
        let command = ArgumentProcessor.parse(arguments: ["test-program"])

        XCTAssertEqual(command, CommandArguments(programName: "test-program", subcommand: "lint", arguments: []))
    }

    func test_parse_noSubcommandWithArguments() {
        let command = ArgumentProcessor.parse(
            arguments: ["test-program", "--reporter", "html"]
        )

        XCTAssertEqual(
            command,
            CommandArguments(programName: "test-program", subcommand: "lint", arguments: ["--reporter", "html"])
        )
    }

    func test_parse_lintSubcommand() {
        let command = ArgumentProcessor.parse(arguments: ["test-program", "lint"])

        XCTAssertEqual(command, CommandArguments(programName: "test-program", subcommand: "lint", arguments: []))
    }

    func test_parse_lintSubcommandWithArguments() {
        let command = ArgumentProcessor.parse(
            arguments: ["test-program", "fix", "--reporter", "html"]
        )

        XCTAssertEqual(
            command,
            CommandArguments(programName: "test-program", subcommand: "fix", arguments: ["--reporter", "html"])
        )
    }

    func test_swiftLintArguments_emptyArguments() {
        let currentDirectory = FileManager.default.currentDirectoryPath

        let lint = ArgumentProcessor.swiftLintArguments(
            fix: false,
            command: CommandArguments(programName: "tuist-swiftlint", subcommand: "lint", arguments: [])
        )
        XCTAssertEqual(lint, [currentDirectory])

        let fix = ArgumentProcessor.swiftLintArguments(
            fix: true,
            command: CommandArguments(programName: "tuist-swiftlint", subcommand: "fix", arguments: [])
        )
        XCTAssertEqual(fix, [currentDirectory, "--fix"])
    }

    func test_swiftLintArguments_fixArgumentSpecified() {
        let currentDirectory = FileManager.default.currentDirectoryPath

        let lint = ArgumentProcessor.swiftLintArguments(
            fix: false,
            command: CommandArguments(programName: "tuist-swiftlint", subcommand: "lint", arguments: ["--fix"])
        )
        XCTAssertEqual(lint, [currentDirectory])

        let fix = ArgumentProcessor.swiftLintArguments(
            fix: true,
            command: CommandArguments(programName: "tuist-swiftlint", subcommand: "fix", arguments: ["--fix"])
        )
        XCTAssertEqual(fix, [currentDirectory, "--fix"])
    }

    func test_swiftFormatArguments_pathSpecified() {
        let lint = ArgumentProcessor.swiftLintArguments(
            fix: false,
            command: CommandArguments(programName: "tuist-swiftlint", subcommand: "lint", arguments: ["project-dir"])
        )
        XCTAssertEqual(lint, ["project-dir"])

        let fix = ArgumentProcessor.swiftLintArguments(
            fix: true,
            command: CommandArguments(programName: "tuist-swiftlint", subcommand: "fix", arguments: ["project-dir"])
        )
        XCTAssertEqual(fix, ["project-dir", "--fix"])
    }

    func test_swiftLintArguments_reporterArgument() {
        let currentDirectory = FileManager.default.currentDirectoryPath
        let arguments = ["--fix", "--reporter", "html"]

        let lint = ArgumentProcessor.swiftLintArguments(
            fix: false,
            command: CommandArguments(programName: "tuist-swiftlint", subcommand: "lint", arguments: arguments)
        )
        XCTAssertEqual(lint, [currentDirectory, "--reporter", "html"])

        let fix = ArgumentProcessor.swiftLintArguments(
            fix: true,
            command: CommandArguments(programName: "tuist-swiftlint", subcommand: "fix", arguments: arguments)
        )
        XCTAssertEqual(fix, [currentDirectory, "--fix", "--reporter", "html"])
    }
}
