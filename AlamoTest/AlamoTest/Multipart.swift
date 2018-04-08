//
//  Multipart.swift
//  AlamoTest
//
//  Created by Guo Jiayu on 4/5/18.
//  Copyright © 2018 Guo Jiayu. All rights reserved.
//

import Foundation
import Alamofire
import UIKit

func uploadImageToServer(image : UIImage){

	let pageURL = "http://damianx-env.us-east-2.elasticbeanstalk.com/setUserProfilePic"
	// init paramters Dictionary
	let parameters =
		["token" : "[B@16419198"]

	// add addtionial parameters


	// example image data
	let imageData = UIImageJPEGRepresentation(image, 0.9)


	Alamofire.upload(multipartFormData: { (multipartFormData) in

		for (key, value) in parameters {
			multipartFormData.append(value.data(using: .utf8)!, withName: key)
		}

		multipartFormData.append(imageData!, withName: "file", fileName: "eggert.jpg", mimeType: "image/jpeg")

	}, to:pageURL)
	{ (result) in
		switch result {
		case .success(let upload, _, _):

			upload.uploadProgress(closure: { (Progress) in
				print("Upload Progress: \(Progress.fractionCompleted)")
			})

			upload.responseString { response in
				//self.delegate?.showSuccessAlert()
				print(response.request!)  // original URL request
				print(response.response!) // URL response
				print(response.data!)     // server data
				print(response.result)   // result of response serialization
				//                        self.showSuccesAlert()
				//self.removeImage("frame", fileExtension: "txt")
				if let JSON = response.result.value {
					print("JSON: \(JSON)")
				}
			}

		case .failure(let encodingError):
			//self.delegate?.showFailAlert()
			print("shit")
			print(encodingError)
		}

	}
}


