import ArgumentParser
import Files
import ShellOut

@main
struct BuildTools: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "A utility to manage build tools",
        subcommands: [InstallDeps.self, PreCommitFormat.self, Pkl.self],
        defaultSubcommand: nil
    )

    mutating func run() throws {
        print(BuildTools.helpMessage())
    }
}

