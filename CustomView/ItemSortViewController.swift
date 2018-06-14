//
//  ItemSortViewController.swift
//  CustomView
//
//  Created by qj.huang on 2018/6/14.
//  Copyright © 2018年 qjmac. All rights reserved.
//

import UIKit

class ItemSortViewController: UIViewController,QJHItemSortViewDelegate {
    func ItemSortViewBtnTapFlag(viewTag: NSInteger, tagFlag: NSInteger) {
        print("\(viewTag):\(tagFlag)")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let itemViewFrame = CGRect.init(x: 10, y: 100, width: SCREEN_WIDTH-30, height: 30)
        let itemView = QJHItemSortView.init(frame: itemViewFrame, arr: ["公司名","公司2"])
        itemView.backgroundColor = UIColor.brown
        itemView.delegate = self
        self.view.addSubview(itemView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
