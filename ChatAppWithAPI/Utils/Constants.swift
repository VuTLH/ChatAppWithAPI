//
//  Constants.swift
//  ChatAppWithAPI
//
//  Created by Huy Vu on 6/7/19.
//  Copyright © 2019 Huy Vu. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

//URL
let BASE_URL = "https://funnychatapp.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_USER_ADD = "\(BASE_URL)user/add"

//Segues
let TO_LOGIN = "toLogin"
let TO_CREATEO_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"

//User defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

//Headers

let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]
