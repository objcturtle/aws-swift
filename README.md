# aws-swift

A starter template for creating a serverless API in Swift on AWS Lambda

---

## Required Technologies

* [Serverless Framework](https://www.serverless.com/framework/)
* [AWS](https://aws.amazon.com)
* [Docker](https://www.docker.com)
* [Swift](https://www.swift.org)

---

## Getting Started

### Create a new project using this template

```
serverless create --template-url https://github.com/thecaseyhanley/aws-swift --path <my-cool-swift-api>
```

### Configure an AWS profile
```
cd <my-cool-swift-api>
make set-profile PROFILE=<my-aws-profile-name>
```

### Deploy starter project to AWS
```
make deploy
```

### Test that the API is working
```
curl <api-endpoint>
```

### Open the Swift package in Xcode to download dependencies
```
open api/Package.swift
```

---

## What am I doing wrong?

* Is Docker running?
* Is your AWS profile configured in `~/.aws/credentials`?
* Does your configured AWS profile have appropriate permissions?
* Do you have Xcode installed? And its command line tools?

---

#### Notes

I made this for personal usage, so it definitely has room for improvement. Hopefully it can help someone troubleshoot their own application of Swift on the server. Enjoy!