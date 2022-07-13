<p align="center">
    <img src="https://img.shields.io/badge/Swift-5.6-orange.svg" />
    <a href="https://swift.org/package-manager">
        <img src="https://img.shields.io/badge/swiftpm-compatible-brightgreen.svg?style=flat" alt="Swift Package Manager" />
    </a>
     <a href="https://github.com/lordcodes/swiftlint-tuist/releases/latest">
         <img src="https://img.shields.io/github/release/lordcodes/swiftlint-tuist.svg?style=flat" alt="Latest release" />
     </a>
    <a href="https://twitter.com/lordcodes">
        <img src="https://img.shields.io/badge/twitter-@lordcodes-blue.svg?style=flat" alt="Twitter: @lordcodes" />
    </a>
</p>

---

This is a **SwiftLint Tuist** - a plugin for Tuist to lint and fix Swift projects using [SwiftLint](https://github.com/realm/SwiftLint).

&nbsp;

<p align="center">
    <a href="#install">Install</a> • <a href="#usage">Usage</a> • <a href="#contributing-or-help">Contributing</a>
</p>

## Install

To set up as a Tuist plugin in your project simply follow the [Tuist plugin install instructions](https://docs.tuist.io/plugins/using-plugins/) using the [latest version](https://github.com/lordcodes/swiftlint-tuist/releases/latest).

Add the plugin to `Config.swift`.

```swift
import ProjectDescription

let config = Config(
    plugins: [
        .git(url: "https://github.com/lordcodes/swiftlint-tuist.git", tag: "[VERSION]")
    ]
)
```

&nbsp;

## Usage

### 🖥 Via the Tuist Plugin

Run SwiftLint Tuist's tasks via Tuist.

```terminal
USAGE: tuist swiftlint [<subcommand>]

DEFAULT SUBCOMMAND:
    Run SwiftLint in lint mode.

SUBCOMMANDS:
    fix               Run SwiftLint in fix/autocorrect mode.
    lint              Run SwiftLint in lint mode.
    help              Print this help information.
    version           Print SwiftLint Tuist version.

See 'tuist swiftlint <subcommand> --help' for detailed help.

```

The plugin is a lightweight wrapper around the SwiftLint command-line tool.

For example, a common set up would be:

- Create a `.swiftlint.yml` config file in the root of the project.
- List all the files/directories to skip using `excluded`.
- From root run `tuist swiftlint` to lint code.
- From root run `tuist swiftlint fix` to fix violations.

## Contributing or Help

If you notice any bugs or have a new feature to suggest, please check out the [contributing guide](https://github.com/lordcodes/swiftlint-tuist/blob/master/CONTRIBUTING.md). If you want to make changes, please make sure to discuss anything big before putting in the effort of creating the PR.

To reach out, please contact [@lordcodes on Twitter](https://twitter.com/lordcodes).
