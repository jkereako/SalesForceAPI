//
//  Endpoints.swift
//  SalesForceAPI
//
//  Created by Jeffrey Kereakoglow on 1/26/16.
//  Copyright © 2016 Innovate!. All rights reserved.
//

// see: https://gist.github.com/chriseidhof/1fc977ffb856dbcdc113
import Foundation

// https://developer.salesforce.com/docs/atlas.en-us.200.0.api_rest.meta/api_rest/resources_limits.htm
enum SalesForce {
  case Versions
  case Limits
  case Licensing
}

extension SalesForce: Path {
  var path: String {
    switch self {
    case .Versions: return "/"
    case .Limits: return "/limits"
    case .Licensing: return "/licensing"
    }
  }
}

extension SalesForce: Restful {
  var baseURL: NSURL { return NSURL(string: "https://na1.salesforce.com/services/data/v35.0")! }
  var sampleData: String {
    switch self {
    case .Versions:
      return "[{\"label\":\"Winter '11\",\"url\":\"/services/data/v20.0\",\"version\":\"20.0\"},{\"label\":\"Spring '11\",\"url\":\"/services/data/v21.0\",\"version\":\"21.0\"},{\"label\":\"Summer '11\",\"url\":\"/services/data/v22.0\",\"version\":\"22.0\"},{\"label\":\"Winter '12\",\"url\":\"/services/data/v23.0\",\"version\":\"23.0\"},{\"label\":\"Spring '12\",\"url\":\"/services/data/v24.0\",\"version\":\"24.0\"},{\"label\":\"Summer '12\",\"url\":\"/services/data/v25.0\",\"version\":\"25.0\"},{\"label\":\"Winter '13\",\"url\":\"/services/data/v26.0\",\"version\":\"26.0\"},{\"label\":\"Spring '13\",\"url\":\"/services/data/v27.0\",\"version\":\"27.0\"},{\"label\":\"Summer '13\",\"url\":\"/services/data/v28.0\",\"version\":\"28.0\"},{\"label\":\"Winter '14\",\"url\":\"/services/data/v29.0\",\"version\":\"29.0\"},{\"label\":\"Spring '14\",\"url\":\"/services/data/v30.0\",\"version\":\"30.0\"},{\"label\":\"Summer '14\",\"url\":\"/services/data/v31.0\",\"version\":\"31.0\"},{\"label\":\"Winter '15\",\"url\":\"/services/data/v32.0\",\"version\":\"32.0\"},{\"label\":\"Spring '15\",\"url\":\"/services/data/v33.0\",\"version\":\"33.0\"},{\"label\":\"Summer '15\",\"url\":\"/services/data/v34.0\",\"version\":\"34.0\"},{\"label\":\"Winter '16\",\"url\":\"/services/data/v35.0\",\"version\":\"35.0\"},{\"label\":\"Spring '16\",\"url\":\"/services/data/v36.0\",\"version\":\"36.0\"}]"
    case .Limits:
      return "{\"ConcurrentAsyncGetReportInstances\":{\"Remaining\":200,\"Max\":200},\"ConcurrentSyncReportRuns\":{\"Remaining\":20,\"Max\":20},\"DailyApiRequests\":{\"Remaining\":14998,\"Max\":15000},\"DailyAsyncApexExecutions\":{\"Remaining\":250000,\"Max\":250000},\"DailyBulkApiRequests\":{\"Remaining\":5000,\"Max\":5000},\"DailyGenericStreamingApiEvents\":{\"Remaining\":10000,\"Max\":10000},\"DailyStreamingApiEvents\":{\"Remaining\":10000,\"Max\":10000},\"DailyWorkflowEmails\":{\"Remaining\":75,\"Max\":75},\"DataStorageMB\":{\"Remaining\":1073,\"Max\":1073},\"FileStorageMB\":{\"Remaining\":1073,\"Max\":1073},\"HourlyAsyncReportRuns\":{\"Remaining\":1200,\"Max\":1200},\"HourlyDashboardRefreshes\":{\"Remaining\":200,\"Max\":200},\"HourlyDashboardResults\":{\"Remaining\":5000,\"Max\":5000},\"HourlyDashboardStatuses\":{\"Remaining\":999999999,\"Max\":999999999},\"HourlySyncReportRuns\":{\"Remaining\":500,\"Max\":500},\"HourlyTimeBasedWorkflow\":{\"Remaining\":50,\"Max\":50},\"MassEmail\":{\"Remaining\":10,\"Max\":10},\"SingleEmail\":{\"Remaining\":15,\"Max\":15},\"StreamingApiConcurrentClients\":{\"Remaining\":1000,\"Max\":1000}}"

    case .Licensing: return "nodata"
    }
  }
}
