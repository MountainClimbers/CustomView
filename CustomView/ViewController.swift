//
//  ViewController.swift
//  CustomView
//
//  Created by qj.huang on 2018/6/14.
//  Copyright © 2018年 qjmac. All rights reserved.
//

import UIKit

class ViewController: UIViewController,QJHSelectViewDelegate {
    func selectViewBtnTap(_ tag: NSInteger) {
        print("点击了:\(tag)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let viewFrame = CGRect.init(x: 0, y: NAVBAR_HEIGHT, width: SCREEN_WIDTH, height: 30)
        let view = QJHSelectView.init(frame: viewFrame, arr: nil)
        view.delegate = self
        self.view.addSubview(view)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

