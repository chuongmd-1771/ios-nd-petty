//
//  FirebaseAuthorizable.swift
//  Petty
//
//  Created by chuongmd on 4/9/19.
//  Copyright © 2019 Sun-Asterisk. All rights reserved.
//

import FirebaseAuth

protocol FirebaseAuthorizable {
    func handleLoginAuthError(with code: AuthErrorCode?)
    func handleRegisterAuthError(with code: AuthErrorCode?)
}
