//
//  MZNetworkManager.swift
//  MZNetwork
//
//  Created by George on 2016/11/16.
//  Copyright © 2016年 George. All rights reserved.
//

import Foundation
import Moya
import SwiftyJSON

enum MZNetWorkRequestStatus {
    case success
    case failure
}

typealias MZNetWorkRequestCompletion = (NSDictionary?, MZNetWorkRequestStatus) -> ()

class MZNetworkManager<ApiType: TargetType> {
    
    //Moya网络请求生成器
    lazy private var productor: MoyaProvider<ApiType> = {
        let tmpProductor = MoyaProvider<ApiType>.init(manager: MoyaProvider<ApiType>.customAlamofireManager(target: self.requestType!))
        return tmpProductor
    }()
    
    //某个Api下的请求类型
    private var requestType: ApiType?
    
    //初始化方法
    required init(_ requestType: ApiType) {
        self.requestType = requestType
    }

    private init() {}
    //进行网络请求
    public func sendRequest(completion: @escaping MZNetWorkRequestCompletion) {
        productor.request(requestType!) { result in
            
            switch result{
            case let .success(response):
                let jsonData = JSON(response.data)
                guard let resultDict = jsonData.dictionaryObject else{
                    completion(nil, MZNetWorkRequestStatus.failure)
                    return
                }
                
                guard let status = resultDict["status"] as? String else{
                    completion(nil, MZNetWorkRequestStatus.failure)
                    return
                }
                
                switch Int(status)!{
                case 0:
                    completion(resultDict as NSDictionary?, MZNetWorkRequestStatus.success)
                default:
                    completion(resultDict as NSDictionary?, MZNetWorkRequestStatus.failure)
                }
                
            case .failure(_):
                completion(nil, MZNetWorkRequestStatus.failure)
            }
        }
    }
}
