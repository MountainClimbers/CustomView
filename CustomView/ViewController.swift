//
//  ViewController.swift
//  CustomView
//
//  Created by qj.huang on 2018/6/14.
//  Copyright © 2018年 qjmac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        
        initTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    
    /*
     * 调用initTableView即可
     */
    func initTableView() {
        self.title = "关注我们"
        
        let tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCellIndentify")
        tableView.separatorStyle = .none
        view.addSubview(tableView)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellIndentify", for: indexPath) as! TableViewCell
        
        if indexPath.section == 0 {
            cell.setCell(txt: "关注我们的微信")
            
        } else {
            cell.setCell(txt: "关注我们的新浪微博")
            cell.lineVi.isHidden = true
        }
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("点击第\(indexPath.section)行")
        if indexPath.section == 0 {
            navigationController?.pushViewController(SelectViewController(), animated: true)
        } else if (indexPath.section == 1) {
            navigationController?.pushViewController(ItemSortViewController(), animated: true)

        }
    }
}


