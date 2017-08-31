//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation
import JSONUtilities

extension TFL.Road {

    public enum RoadDisruption {

        public static let service = APIService<Response>(id: "Road_Disruption", tag: "Road", method: "GET", path: "/Road/{ids}/Disruption", hasBody: false)

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** Comma-separated list of road identifiers e.g. "A406, A2" use all for all to ignore id filter (a full list of supported road identifiers can be found at the /Road/ endpoint) */
                public var ids: [String]

                /** Optional, defaults to false. When true, removes every property/node except for id, point, severity, severityDescription, startDate, endDate, corridor details, location, comments and streets */
                public var stripContent: Bool?

                /** an optional list of Severity names to filter on (a valid list of severities can be obtained from the /Road/Meta/severities endpoint) */
                public var severities: [String]?

                /** an optional list of category names to filter on (a valid list of categories can be obtained from the /Road/Meta/categories endpoint) */
                public var categories: [String]?

                /** Optional, defaults to true. When true, always includes disruptions that have road closures, regardless of the severity filter. When false, the severity filter works as normal. */
                public var closures: Bool?

                public init(ids: [String], stripContent: Bool? = nil, severities: [String]? = nil, categories: [String]? = nil, closures: Bool? = nil) {
                    self.ids = ids
                    self.stripContent = stripContent
                    self.severities = severities
                    self.categories = categories
                    self.closures = closures
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: RoadDisruption.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(ids: [String], stripContent: Bool? = nil, severities: [String]? = nil, categories: [String]? = nil, closures: Bool? = nil) {
                let options = Options(ids: ids, stripContent: stripContent, severities: severities, categories: categories, closures: closures)
                self.init(options: options)
            }

            public override var path: String {
                return super.path.replacingOccurrences(of: "{" + "ids" + "}", with: "\(self.options.ids.joined(separator: ","))")
            }

            public override var parameters: [String: Any] {
                var params: JSONDictionary = [:]
                if let stripContent = options.stripContent {
                  params["stripContent"] = stripContent
                }
                if let severities = options.severities?.joined(separator: ",") {
                  params["severities"] = severities
                }
                if let categories = options.categories?.joined(separator: ",") {
                  params["categories"] = categories
                }
                if let closures = options.closures {
                  params["closures"] = closures
                }
                return params
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = [RoadDisruption]

            /** OK */
            case status200([RoadDisruption])

            public var success: [RoadDisruption]? {
                switch self {
                case .status200(let response): return response
                }
            }

            public var response: Any {
                switch self {
                case .status200(let response): return response
                }
            }

            public var statusCode: Int {
                switch self {
                case .status200: return 200
                }
            }

            public var successful: Bool {
                switch self {
                case .status200: return true
                }
            }

            public init(statusCode: Int, data: Data) throws {
                switch statusCode {
                case 200: self = try .status200(JSONDecoder.decode(data: data))
                default: throw APIError.unexpectedStatusCode(statusCode: statusCode, data: data)
                }
            }

            public var description: String {
                return "\(statusCode) \(successful ? "success" : "failure")"
            }

            public var debugDescription: String {
                var string = description
                let responseString = "\(response)"
                if responseString != "()" {
                    string += "\n\(responseString)"
                }
                return string
            }
        }
    }
}
