//
//  MoyaCustomExtension.swift
//  MZNetwork
//
//  Created by George on 2016/11/16.
//  Copyright © 2016年 George. All rights reserved.
//

import Foundation
import Moya

extension MoyaProvider{
    public final class func customAlamofireManager(target: TargetType) -> Manager {
        let configuration = URLSessionConfiguration()
        configuration.timeoutIntervalForRequest = target.timeoutInterval
        
        // 设置请求头
        configuration.httpAdditionalHeaders = Manager.defaultHTTPHeaders
        
        let manager = Manager(configuration: configuration)
        manager.startRequestsImmediately = false
        return manager
    }
}
