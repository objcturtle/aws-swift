#!/usr/bin/env swift

import Foundation

var profile = "default"
if CommandLine.arguments.count > 1 {
    profile = CommandLine.arguments[1]
} else if let projectName = FileManager.default.currentDirectoryPath.split(separator: "/").last {
    profile = String(projectName)
}

print("AWS_PROFILE is now \(profile)")

let file = ".aws/credentials"
let dir = FileManager.default.homeDirectoryForCurrentUser
let fileURL = dir.appendingPathComponent(file)

let credentialsFileContents = try! String(contentsOf: fileURL, encoding: .utf8)
let credentials = credentialsFileContents.split(separator: "\n")
if let desiredProfileIndex = credentials.firstIndex(where: { $0 == "[\(profile)]"}) {
    let awsAccessKeyIdIndex = desiredProfileIndex + 1
    let awsSecretAccessKeyIndex = desiredProfileIndex + 2
    let awsAccessKeyIdLine = credentials[awsAccessKeyIdIndex]
    let awsSecretAccessKeyLine = credentials[awsSecretAccessKeyIndex]
    let awsAccessKeyId = awsAccessKeyIdLine.split(separator: "aws_access_key_id=")[0]
    let awsSecretAccessKey = awsSecretAccessKeyLine.split(separator: "aws_secret_access_key=")[0]

    
    let envFile = ".env"
    let curDir = FileManager.default.currentDirectoryPath
    // let envDir = "/" + curDir.split(separator: "/").dropLast().joined(separator: "/")
    let envDir = curDir
    let envFileURL = URL(fileURLWithPath: envDir + "/" + envFile)
    let envFileContents = try! String(contentsOf: envFileURL, encoding: .utf8)
    
    let lines = envFileContents.split(separator: "\n")
    var newLines: [String] = []
    for line in lines {
        var newLine = ""
        if line.contains("AWS_PROFILE=") {
            newLine = "AWS_PROFILE=\(profile)"
        } else if line.contains("LAMBDA_AWS_ACCESS_KEY_ID=") {
        newLine = "LAMBDA_AWS_ACCESS_KEY_ID=\(awsAccessKeyId)"
        } else if line.contains("LAMBDA_AWS_SECRET_ACCESS_KEY=") {
            newLine = "LAMBDA_AWS_SECRET_ACCESS_KEY=\(awsSecretAccessKey)"
        } else {
            newLine = String(line)
        }
        newLines.append(newLine)
    }
    let newFileContents = newLines.joined(separator: "\n")
    try! newFileContents.write(to: envFileURL, atomically: false, encoding: .utf8)
}
