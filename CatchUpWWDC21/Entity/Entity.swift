//
//  Entity.swift
//  CatchUpWWDC21
//
//  Created by 吉田周平 on 2021/06/12.
//

import SwiftUI

struct Post: Identifiable, Decodable {
    var id: Int
    var title: String
    var body: String
}
