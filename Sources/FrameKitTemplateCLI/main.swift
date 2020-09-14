import Foundation
import ArgumentParser
import FrameKit

let rootDirectory = "/" + URL(string: #file)!.absoluteURL.pathComponents.dropFirst().dropLast().dropLast().dropLast().joined(separator: "/")
let templateDirectory = URL(string: rootDirectory + "/Sources/DefaultFrameKitLayout")!

struct FramekitGen: ParsableCommand {
    @Option
    var output: String

    func run() throws {
        let fileManager = FileManager.default
        if !fileManager.fileExists(atPath: output) {
            try fileManager.createDirectory(atPath: output, withIntermediateDirectories: true, attributes: nil)
        }

        for item in try fileManager.contentsOfDirectory(atPath: templateDirectory.path) {
            let from = templateDirectory.path + "/" + item
            let to =  absolutePath(output) + "/" + item
            try fileManager.copyItem(atPath: from, toPath: to)
            print("Copied: \(to)")
        }
    }
}

FramekitGen.main()
