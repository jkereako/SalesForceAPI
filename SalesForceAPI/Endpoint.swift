//
//  Endpoint.swift
//  SalesForceAPI
//
//  Created by Jeffrey Kereakoglow on 1/26/16.
//  Copyright © 2016 Innovate!. All rights reserved.
//

import Foundation

protocol Path {
  var path : String { get }
}

protocol Restful: Path {
  var baseURL: NSURL { get }
  var sampleData: String { get } // Probably JSON would be better than AnyObject
}