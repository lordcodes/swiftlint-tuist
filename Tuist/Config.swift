import ProjectDescription

let config = Config(
    plugins: [
        .git(url: "https://github.com/lordcodes/swiftformat-tuist", tag: "v0.6.0"),
        .git(url: "https://github.com/lordcodes/swiftlint-tuist", tag: "v0.2.0"),
    ]
)
