// Copyright © 2022 Andrew Lord.

@main
enum MainApp {
    static func main() async {
        await MainCommand(arguments: CommandLine.arguments).run()
    }
}
