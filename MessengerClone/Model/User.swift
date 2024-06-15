//
//  User.swift
//  MessengerClone
//
//  Created by Ulaş Ardıl KARACA on 15.06.2024.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Codable, Identifiable{
    @DocumentID var uid: String?
    
    let fullname: String
    let email: String
    var profileImageUrl: String?
    var id: String{
        return uid ?? NSUUID().uuidString
    }
    
}
