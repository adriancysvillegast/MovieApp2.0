//
//  GuestSession.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 24/7/22.
//

import Foundation

struct GuestSession: Codable {
    let success: Bool
    let guestSessionId: String
    let expiresAt: String
}
