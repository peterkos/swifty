import ArgumentParser
import Files
import ShellOut

@main
struct Swifty: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "A set of Swift build scripts to aid iOS development.",
        subcommands: [InstallDeps.self, PreCommitFormat.self, Pkl.self],
        defaultSubcommand: nil
    )

    mutating func run() throws {
        print(Swifty.helpMessage())
    }
}

