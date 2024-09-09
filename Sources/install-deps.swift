import ArgumentParser
import Files
import ShellOut

struct InstallDeps: ParsableCommand {
    func run() throws {
        do {
            let brew = "brew install --quiet"
            let dependencies = [
                "fastlane": "\(brew) fastlane",
                "swiftformat": "\(brew) swiftformat",
                "bun": "\(brew) oven-sh/bun/bun",
                "xcbeautify": " \(brew) xcbeautify",
            ]

            for (name, installCommand) in dependencies {
                print("- Installing \(name)...")
                try print(shellOut(to: installCommand), terminator: "")
                print("o7 \(name) installed.\n")
            }
        } catch {
            guard let error = error as? ShellOutError else {
                print("Unknown error \(error)")
                return
            }
            print(error.message)
            print(error.output)
        }
    }
}
