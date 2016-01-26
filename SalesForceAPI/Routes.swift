//
//  Routes.swift
//  SalesForceAPI
//
//  Created by Jeffrey Kereakoglow on 1/26/16.
//  Copyright © 2016 Innovate!. All rights reserved.
//

import Foundation

struct Routes {
  func url(route: Restful) -> NSURL {
    return route.baseURL.URLByAppendingPathComponent(route.path)
  }
}