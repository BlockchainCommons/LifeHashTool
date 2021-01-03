//
//  LifeHashTool.swift
//
//  Copyright © 2020 by Blockchain Commons, LLC
//  Licensed under the "BSD-2-Clause Plus Patent License"
//
//  Created by Wolf McNally on 12/31/2020.
//

import Foundation
import LifeHash
import AppKit

do {
    try LifeHashTool().run()
} catch ToolError.developer(let message) {
    print("⛔️ \(message)")
    exit(1)
} catch ToolError.user(let message) {
    print("🤨 \(message)")
    print("")
    printUsage()
    exit(1)
}

func printUsage() {
    print(
        """
        Usage: \(CommandLine.arguments.first!) [OPTION...] [INPUT]

          -v VERSION      [version1|version2|detailed|fiducial|grayscaleFiducial] (default: version2)
          -m MODULE_SIZE  Size of each module ("pixel") (default: 1)
          -p OUTPUT_PATH  (default: current directory)

          -h --help       Print this message.

        * The output PNG file will have the same name as the INPUT string.

        * If no INPUT string is provided, a random one will be generated of the form "XXX-XXX" where X is a random letter.
        """
    )
}

public final class LifeHashTool {
    public func run(arguments: [String] = CommandLine.arguments) throws {
        let parms = try Parameters(arguments)
        let modules = LifeHashGenerator.modules(version: parms.version)
        let image = LifeHashGenerator.generateSync(parms.input, version: parms.version).resized(to: CGFloat(modules * parms.moduleSize))
        let imageData = try image.pngData()
        try imageData.write(to: parms.outputFile)
    }
    
    struct Parameters {
        let input: String
        let version: LifeHashVersion
        let moduleSize: Int
        let outputFile: URL
        
        init(_ arguments: [String]) throws {
            var remaining = arguments.dropFirst()
            
            var hasNext: Bool {
                !remaining.isEmpty
            }
            
            var lookNext: String {
                remaining.first!
            }
            
            @discardableResult
            func next() throws -> String {
                guard hasNext else {
                    throw ToolError.user("Insufficient arguments.")
                }
                defer {
                    remaining = remaining.dropFirst()
                }
                return lookNext
            }
            
            func nextInt() throws -> Int {
                let s = try next()
                guard let i = Int(s) else {
                    throw ToolError.user("Expected integer.")
                }
                return i
            }
            
            var version: LifeHashVersion!
            var input: String!
            var moduleSize: Int!
            var outputPath: URL = FileManager.default.currentDirectory
            
            loop:
            while hasNext {
                switch lookNext {
                case "-h", "--help":
                    printUsage()
                    exit(0)
                case "-v":
                    try next()
                    switch try next() {
                    case "version1":
                        version = .version1
                    case "version2":
                        version = .version2
                    case "detailed":
                        version = .detailed
                    case "fiducial":
                        version = .fiducial
                    case "grayscaleFiducial":
                        version = .grayscaleFiducial
                    default:
                        throw ToolError.user("Invalid version.")
                    }
                case "-m":
                    try next()
                    moduleSize = try nextInt()
                case "-p":
                    try next()
                    outputPath = try URL(fileURLWithPath: next(), isDirectory: true)
                default:
                    break loop
                }
            }
            if hasNext {
                input = try next()
            }
            guard remaining.isEmpty else {
                throw ToolError.user("Extra unknown arguments found: \(remaining).")
            }
            
            if input == nil {
                input = makeRandomFiducialName()
            }

            let outputFilename = input + ".png"

            self.input = input
            self.version = version ?? .version2
            self.moduleSize = moduleSize ?? 1
            self.outputFile = outputPath.appendingPathComponent(outputFilename)
        }
    }
}

enum ToolError: Error {
    case developer(String)
    case user(String)
}

extension NSImage {
    func pngData() throws -> Data {
        guard let cgImage = cgImage(forProposedRect: nil, context: nil, hints: nil) else {
            throw ToolError.developer("Unable to get CGImage.")
        }
        let imageRep = NSBitmapImageRep(cgImage: cgImage)
        imageRep.size = size // display size in points
        return imageRep.representation(using: .png, properties: [:])!
    }
    
    func resized(to targetSize: CGSize) -> NSImage {
        guard size != targetSize else { return self }
        
        let img = NSImage(size: targetSize)
        img.lockFocus()
        defer {
            img.unlockFocus()
        }
        if let ctx = NSGraphicsContext.current {
            ctx.imageInterpolation = .none
            draw(in: NSRect(origin: .zero, size: targetSize),
                 from: NSRect(origin: .zero, size: size),
                 operation: .copy,
                 fraction: 1)
        }
        return img
    }
    
    func resized(to targetSize: CGFloat) -> NSImage {
        resized(to: CGSize(width: targetSize, height: targetSize))
    }
}

extension FileManager {
    var currentDirectory: URL {
        URL(fileURLWithPath: currentDirectoryPath, isDirectory: true)
    }
}

func makeRandomFiducialName() -> String {
    let segments = (0 ..< 2).map { _ in
        String((0 ..< 3).map { _ in
            "ABCDEFGHIJKLMNOPQRSTUVWXYZ".randomElement()!
        })
    }
    return segments.joined(separator: "-")
}
