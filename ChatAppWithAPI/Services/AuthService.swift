//
//  SAuthService.swift
//  ChatAppWithAPI
//
//  Created by Huy Vu on 6/8/19.
//  Copyright © 2019 Huy Vu. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AuthService {
    
    static let instance = AuthService()
    let defaults = UserDefaults.standard
    var isLoggedIn: Bool {
        get {
            return defaults.bool(forKey: LOGGED_IN_KEY)
        }
        set {
            defaults.set(newValue, forKey: LOGGED_IN_KEY)
        }
    }
    
    var authToken: String {
        get {
            return defaults.value(forKey: TOKEN_KEY) as! String
        }
        set {
            defaults.set(newValue, forKey: TOKEN_KEY)
        }
    }
    var userEmail: String {
        get {
            return defaults.value(forKey: USER_EMAIL) as! String
        }
        set {
            defaults.set(newValue, forKey: USER_EMAIL)
        }
    }
    
    func registerUser(email: String, password: String, completion: @escaping CompletionHandler) {
        let lowerCaseEmail = email.lowercased()
        let body = [
            "email": lowerCaseEmail,
            "password": password
        ]
        
        Alamofire.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseString { (response) in
            
            if response.result.error == nil {
                //kết quả trả về ko bị lỗi
                completion(true)
            }else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
            
        }
        
    }
    
    func loginUser(email: String, password: String, completion: @escaping CompletionHandler) {
        let lowerCaseEmail = email.lowercased()
        let body = [
            "email": lowerCaseEmail,
            "password": password
        ]
        
        Alamofire.request(URL_LOGIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            
            if response.result.error == nil {
                //ket qua tra ve ko bi loi
                /** Parse Json kiểu cũ
                if let json = response.result.value as? Dictionary<String, Any> {
                    if let email = json["user"] as? String {
                        self.userEmail = email
                    }
                    if let token = json["token"] as? String {
                        self.authToken = token
                    }
                }
                **/
                
                //Parse Json bằng SwiftyJson
                guard let data = response.data else {return}
                do {
                    let json = try JSON(data: data)
                    self.userEmail = json["user"].stringValue
                    self.authToken = json["token"].stringValue
                }catch {
                    let err = error as NSError
                    print("Error parsing JSon: \(err.localizedDescription)")
                }
                
                self.isLoggedIn = true
                
                completion(true)
            }else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
}
