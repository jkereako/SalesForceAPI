//
//  OAuth2.swift
//  SalesForceAPI
//
//  Created by Jeffrey Kereakoglow on 1/26/16.
//  Copyright © 2016 Innovate!. All rights reserved.
//

import Foundation

enum OAuth2 {
  // https://developer.salesforce.com/docs/atlas.en-us.200.0.api_rest.meta/api_rest/resources_limits.htm
  case Authorize(responseType: String, clientID: String, redirectURI: String)
  case Token(grantType: String, clientID: String, clientSecret: String, username: String, password: String)
  case Revoke
}

extension OAuth2: Path {
  var path: String {
    switch self {

    case .Authorize(let responseType, let clientID, let redirectURI):
      // Delegate the query string building to Cocoa
      let urlComponents = NSURLComponents()
      urlComponents.queryItems = [
        NSURLQueryItem(name: "client_id", value: clientID),
        NSURLQueryItem(name: "response_type", value: responseType),
        NSURLQueryItem(name: "redirect_uri", value: redirectURI)
      ]

      return urlComponents.percentEncodedQuery!

    case .Token( let grantType, let clientID, let clientSecret, let username, let password):

      let urlComponents = NSURLComponents()
      urlComponents.queryItems = [
        NSURLQueryItem(name: "grant_type", value: grantType),
        NSURLQueryItem(name: "client_id", value: clientID),
        NSURLQueryItem(name: "client_secret", value: clientSecret),
        NSURLQueryItem(name: "username", value: username),
        NSURLQueryItem(name: "password", value: password)
      ]

      return urlComponents.percentEncodedQuery!

    case .Revoke: return ""
    }
  }
}

extension OAuth2: Restful {
  var baseURL: NSURL { return NSURL(string: "https://login.salesforce.com/services/oauth2")! }
  var sampleData: String {
    switch self {

    case .Authorize(let responseType, let clientID, let redirectURI):
      return "?response_type=\(responseType)&client_id=\(clientID)&redirect_uri=\(redirectURI)"

    case .Token(let clientID, let clientSecret, let username, let password, let grantType):
      return "?client_id=\(clientID)&client_secret=\(clientSecret)&username=\(username)&password=\(password)&grant_type=\(grantType)"
      
    case .Revoke: return ""
    }
  }
}