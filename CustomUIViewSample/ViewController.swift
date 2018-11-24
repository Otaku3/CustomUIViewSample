//
//  ViewController.swift
//  CustomUIViewSample
//
//  Created by 大林拓実 on 2018/11/13.
//  Copyright © 2018年 TakumiObayashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var firstCustomView: CustomView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        firstCustomView.rightLabel.text = "右"
        firstCustomView.leftLabel.text = "左"
        
        let customView = CustomView(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        view.addSubview(customView)
        
    }
    
    @IBAction func tapButton(){
        var buttonedCustomView = CustomView(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        buttonedCustomView.leftLabel.text = "left"
        buttonedCustomView.rightLabel.text = "right"
        view.addSubview(buttonedCustomView)
    }


}

