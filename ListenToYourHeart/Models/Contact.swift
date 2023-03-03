//
//  Contact.swift
//  ListenToYourHeart
//
//  Created by andi a on 27.02.23.
//

import Foundation

struct Contact: Identifiable, Hashable{
    var id = UUID()
    var name: String
    var contactId: Int
}
