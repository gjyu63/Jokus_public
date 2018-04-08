//
//  HttpRequestHelper.swift
//  AlamoTest
//
//  Created by Guo Jiayu on 4/5/18.
//  Copyright © 2018 Guo Jiayu. All rights reserved.
//

import UIKit
import Alamofire

class HttpRequestHelper: NSObject {
	func makeRequest(parameters: [String : String], url: String) -> String
	{
		var retStr : String = ""
		Alamofire.request(url, method:.post,parameters : parameters,encoding: URLEncoding.default).responseString { response in
			switch response.result {
			case .success:
				retStr = response.result.value!
//				print(retStr)
			case .failure(let error):
				print (error)
			}
		}
//		print(retStr)
		return retStr
	}
}
