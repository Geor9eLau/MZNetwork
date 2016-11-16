//
//  VIPApi.swift
//  VIPApi
//
//  Created by George on 2016/11/15.
//  Copyright © 2016年 George. All rights reserved.
//

import Foundation
import Moya




enum VIPApi {
    case judgeIfSignIn
    case getSignInGift
    case getSignInGiftDetail
}

extension VIPApi: TargetType{
  
    
    var timeoutInterval: Double{
        switch self {
        case .judgeIfSignIn:
            return 5.0
        default:
            return 3.0
        }
    }
    
    var baseURL: URL{
        return URL(string: "http://mobileif.maizuo.com")!
    }
    
    var method: Moya.Method{
        return .post
    }
    
    var parameters: [String : Any]?{
        return nil
    }
    
    var path: String{
        switch self {
        case .judgeIfSignIn:
            return "v5/api/signInGift/judge?"
        default:
            return ""
        }
    }
    
    var task: Task{
        return .request
    }
    
    var sampleData: Data{
        return Data()
    }
    
    
}






