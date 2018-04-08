//
//  ViewController.swift
//  AlamoTest
//
//  Created by Guo Jiayu on 4/4/18.
//  Copyright © 2018 Guo Jiayu. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
	@IBOutlet weak var iv: UIImageView!
	
    func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }

	@IBOutlet weak var text1: UILabel!
	override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
		
		let image : UIImage = UIImage(named: "eggert")!
		
		iv.image = image
		uploadImageToServer(image: image);
	
		
	}
	


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


