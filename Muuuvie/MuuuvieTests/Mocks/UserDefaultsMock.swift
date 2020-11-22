//
//  UserDefaultsMock.swift
//  MuuuvieTests
//
//  Created by Emilio Heinzmann on 22/11/20.
//

import Foundation

class UserDefaultsMock : UserDefaults {
  
  convenience init() {
    self.init(suiteName: "UserDefaultsMockk")!
  }
  
  override init?(suiteName suitename: String?) {
    UserDefaults().removePersistentDomain(forName: suitename!)
    super.init(suiteName: suitename)
  }
  
}
