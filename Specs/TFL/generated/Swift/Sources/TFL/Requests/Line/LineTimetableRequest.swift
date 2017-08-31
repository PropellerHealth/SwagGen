//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation
import JSONUtilities

extension TFL.Line {

    public enum LineTimetable {

        public static let service = APIService<Response>(id: "Line_Timetable", tag: "Line", method: "GET", path: "/Line/{id}/Timetable/{fromStopPointId}", hasBody: false)

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** The originating station's stop point id (station naptan code e.g. 940GZZLUASL, you can use /StopPoint/Search/{query} endpoint to find a stop point id from a station name) */
                public var fromStopPointId: String

                /** A single line id e.g. victoria */
                public var id: String

                public init(fromStopPointId: String, id: String) {
                    self.fromStopPointId = fromStopPointId
                    self.id = id
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: LineTimetable.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(fromStopPointId: String, id: String) {
                let options = Options(fromStopPointId: fromStopPointId, id: id)
                self.init(options: options)
            }

            public override var path: String {
                return super.path.replacingOccurrences(of: "{" + "fromStopPointId" + "}", with: "\(self.options.fromStopPointId)").replacingOccurrences(of: "{" + "id" + "}", with: "\(self.options.id)")
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = TimetableResponse

            /** OK */
            case status200(TimetableResponse)

            public var success: TimetableResponse? {
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
