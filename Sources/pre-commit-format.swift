import ArgumentParser
import Files
import ShellOut

struct PreCommitFormat: ParsableCommand {
    func run() throws {
        do {
            try print(
                shellOut(to: .createFile(
                    named: "../.git/hooks/pre-commit",
                    contents:
                    #"""
                    #!/bin/sh
                    git-format-staged --formatter \"swiftformat stdin --stdinpath '{}'\" \"*.swift\"
                    """#
                ))
            )
            try shellOut(to: "chmod +x ../.git/hooks/pre-commit")
        } catch {
            guard let error = error as? ShellOutError else {
                print("Unknown error \(error)")
                return
            }
            print(error.message)
            print(error.output)
            return
        }
        print("Configured pre-commit format hook successfully!\n")
        print("Ensure that `git-format-staged` and `swiftformat` are installed")
        print("as follows, or the hook will not work:")
        print("\tbrew install swiftformat")
        print("\tbun install -g git-format-staged")
        print("")
        print("(Or, run `buildtools install-deps` to do this for ya!)")
    }
}
