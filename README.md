## Create a new project ("my-cool-api" in this example) using the template

`serverless create --template-url https://github.com/thecaseyhanley/aws-swift --path <my-cool-swift-api>`

## Configure an AWS profile

`cd my-cool-swift-api`
`make set-profile PROFILE=<my-aws-profile-name>`

## Deploy starter project to AWS
`make deploy`

## Test that the API is working
`curl <api-endpoint>`

## Write some actual Swift code!
`open api/Package.swift`