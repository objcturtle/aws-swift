import Foundation
import AWSLambdaRuntime
import AWSLambdaEvents

Lambda.run { (
    context,
    request: APIGateway.V2.Request,
    callback: @escaping (Result<APIGateway.V2.Response, Error>) -> Void
) in
    do {
        let response = APIGateway.V2.Response(
            statusCode: .ok,
            body: try JSONEncoder().encodeAsString(request)
        )
        NSLog("Success!")
        callback(.success(response))
    } catch {
        let response = APIGateway.V2.Response(
            statusCode: .imATeapot
        )
        NSLog("Error!")
        callback(.success(response))
    }
}
