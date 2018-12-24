//
//  ViewController.swift
//  DDXMLWork
//
//  Created by 风荷举 on 2018/12/3.
//  Copyright © 2018年 ddWorker. All rights reserved.
//

import UIKit
import Alamofire
import Kanna
import XMLDictionary
import SwiftyJSON
import Macaw


class ViewController: UIViewController {
        
    @IBOutlet weak var button: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func asss()
    {
        
        for bt in [button] {
            //1.绕中心圆移动 Circle move
            let pathAnimation = CAKeyframeAnimation(keyPath: "position")
            pathAnimation.calculationMode = .paced
            pathAnimation.fillMode = .forwards
            pathAnimation.isRemovedOnCompletion = false
            pathAnimation.repeatCount = .infinity
            pathAnimation.timingFunction = CAMediaTimingFunction(name: .linear)
            pathAnimation.duration = 8.0
            pathAnimation.path = CGPath.init(ellipseIn: bt!.frame, transform: nil)
            bt!.layer.add(pathAnimation, forKey: "circleAnimation")
            
            //2.X方向上的缩放 scale in X
            let scaleX = CAKeyframeAnimation(keyPath:"transform.scale.x")
            scaleX.values = [1.0, 1.1, 1.0]
            scaleX.keyTimes = [0.0, 0.5,1.0]
            scaleX.repeatCount = .infinity
            scaleX.autoreverses = true
            scaleX.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            scaleX.duration = 5
            bt!.layer.add(scaleX, forKey: "scaleXAnimation")
            
            //2.Y方向上的缩放 scale in Y
            let scaleY = CAKeyframeAnimation(keyPath:"transform.scale.y")
            scaleY.values = [1.0, 1.1, 1.0]
            scaleY.keyTimes = [0.0, 0.5,1.0]
            scaleY.repeatCount = .infinity
            scaleY.autoreverses = true
            scaleX.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            scaleY.duration = 5
            bt!.layer.add(scaleY, forKey: "scaleYAnimation")
            
        }

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let x = "/html/body"
        let path = Bundle.main.url(forResource: "1K410000", withExtension: "html")!
        if let doc = try? HTML(url: path, encoding: .utf8) {
            for link in doc.xpath(x) {
                let dic = XMLDictionaryParser.sharedInstance().dictionary(with: link.toXML!)
                if let data = try? JSONSerialization.data(withJSONObject: dic!, options: []) {
                    let list = JSON(data)["div"]
                    print(list)
                }
            }
        }
        
        // //*[@id="LC1"]
        
//        if let doc = try? HTML(url: URL(string: "https://www.wenjiwu.com")!, encoding: .utf8) {
//            for link in doc.xpath("/html/body/div[6]") {
//                let xml: String = link.toXML!
//                let a = XMLDictionaryParser.sharedInstance().dictionary(with: xml)
//                if let data = try? JSONSerialization.data(withJSONObject: a!, options: []) {
//                    let list = JSON(data)
//                    print(list)
//                }
//            }
        
//            for link in doc.xpath("/html/body/div[2]/div[2]/ul/li") {
//                let xml: String = link.toXML!
//                let a = XMLDictionaryParser.sharedInstance().dictionary(with: xml)
//                if let data = try? JSONSerialization.data(withJSONObject: a!, options: []) {
//                    let list = JSON(data)
//                    print(list)
//                }
//            }
        
//            for link in doc.xpath("/html/body/div[6]/div[1]/div") {
//                let xml: String = link.toXML!
//                let a = XMLDictionaryParser.sharedInstance().dictionary(with: xml)
//                if let data = try? JSONSerialization.data(withJSONObject: a!, options: []) {
//                    let list = JSON(data)
//                    for l in list {
//                        print(l)
//                    }
//                }
//            }
//        }
        
//        if let doc = try? HTML(url: URL(string: "https://www.wenjiwu.com/qinqing/97.html")!, encoding: .utf8) {
//            let xml = doc.at_xpath("/html/body/div[4]/div[1]/div[1]/div/article")!
//            webView.loadHTMLString(xml.toXML!, baseURL: nil)
//            for link in doc.xpath("/html/body/div[4]/div[1]/div[1]/div/article") {
//                let xml: String = link.toXML!
//                let a = XMLDictionaryParser.sharedInstance().dictionary(with: xml)
//                if let data = try? JSONSerialization.data(withJSONObject: a!, options: []) {
//                    let list = JSON(data)["p"]
//                }
//            }
//        }
        
    }
}

