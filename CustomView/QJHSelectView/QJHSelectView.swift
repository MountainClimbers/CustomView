//
//  QJHSelectView.swift
//  QJHSelectView
//
//  Created by qj.huang on 2018/6/14.
//  Copyright © 2018年 qjmac. All rights reserved.
//

import UIKit
import Foundation

protocol QJHSelectViewDelegate {
    func selectViewBtnTap(_ tag:NSInteger)  //点击
}

class QJHSelectView: UIView {
    
    let constNum1 = 10
    let constNum2 = 100

    
    let kBackGroudColor = UIColor.groupTableViewBackground

    private var _normalColor: UIColor?
    private var _selectColor: UIColor?
    private var _dataArr:[String]?
    
    //MARK: - 选择数据源
    private var dataArr: [String]?
    
    //MARK: - 设置未选中颜色
    var normalColor:UIColor?{
        
        get{
            return (_normalColor != nil) ? _normalColor! : UIColor.darkGray
        }
        set(color){
            _normalColor = color
            
            refreshView(tag: self.selectIndex)

        }
    }
    
    private var _lineViewHeight: CGFloat?
    
    //MARK: - 下划线高度
    var lineViewHeight: CGFloat? {
        get{
            return _lineViewHeight != nil ? _lineViewHeight : 4
        }
        set(height){
            _lineViewHeight = height
            
            refreshLineViewHeight(height: height!)
        }
    }
    
    private var _lineViewWidth: CGFloat?
    
    //MARK: - 下划线长度
    var lineViewWidth: CGFloat? {
        get{
            return _lineViewWidth != nil ? _lineViewWidth : (SCREEN_WIDTH)/CGFloat((self.dataArr?.count)!)/2.0
        }
        set(width){
            
            _lineViewWidth = width
            
            refreshLineViewWidth(width: width!)
        }
    }
    
    //MARK: - 设置选中颜色
    var selectColor:UIColor?{
        
        get{
            return (_selectColor != nil) ? _selectColor! : UIColor.red
        }
        set(color){
            _selectColor = color
            
            refreshView(tag: self.selectIndex)

        }
    }
    
    private var _selectIndex: NSInteger = 10
    // 10 11 12 13 从10开始计数,10代表第一个页面 11代表第二个页面
    var selectIndex: NSInteger {
        get{
            return _selectIndex
        }
        set(flag) {
            _selectIndex = flag
            
            triggerButton(tag: flag)
        }
    }
    
    private var _delegate: QJHSelectViewDelegate?
    
    var delegate: QJHSelectViewDelegate?{
        
        get{
            return _delegate
        }
        
        set(deleg) {
            _delegate = deleg
            
            triggerButton(tag: _selectIndex)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(frame:CGRect, arr:[String]?) {
        super.init(frame: frame)
        
        self.dataArr = arr != nil ? arr! : ["正式客户","潜在客户"]
        
        self.initView()
        
    }
    
    func initView() {
        
        let halfWidth = self.width / CGFloat((self.dataArr?.count)!)
        
        self.backgroundColor = kBackGroudColor
        
        var count = 0
        for str in self.dataArr! {
            
            let btn = UIButton()
            btn.setTitle(str, for: .normal)
            btn.frame = CGRect.init(x: CGFloat(count) * halfWidth , y: 0, width: halfWidth, height: self.height)
            btn.tag = count + constNum1
            btn.addTarget(self, action: #selector(self.btnTap(_:)), for: .touchUpInside)
            self.addSubview(btn)
            
            let vi = UIView()
            vi.frame = CGRect.init(x: btn.left , y: self.height - (self.lineViewHeight ?? 0), width: self.lineViewWidth ?? 0, height: self.lineViewHeight ?? 0)
            vi.centerX = btn.centerX
            vi.tag = count + constNum2
            self.addSubview(vi)
            
            if count == 0 {
                btn.setTitleColor(self.selectColor, for: .normal)
                vi.backgroundColor = self.selectColor
            } else {
                btn.setTitleColor(self.normalColor, for: .normal)
                vi.isHidden = true
            }
            
            count = count + 1
        }

    }
    
    func triggerButton(tag: NSInteger) {
        
        var view:UIView!
        
        for subView in self.subviews {
            if subView.tag == tag {
                view = subView
            }
        }
        
        if let view = view {
            self.btnTap((view as! UIButton))
        }
        
    }
    
    @objc func btnTap(_ sender:UIButton) {
        let numTag = sender.tag
        
        refreshView(tag:numTag)
        
        //代理
        if delegate != nil {
            delegate?.selectViewBtnTap(numTag)
        }
    }
    
    //MARK: - 更新UI
    func refreshView(tag:NSInteger) {
      
        for view in self.subviews {
            
            if view.isKind(of: UIButton.self){
                if view.tag == tag {
                    (view as! UIButton).setTitleColor(self.selectColor, for: .normal)
                } else {
                    (view as! UIButton).setTitleColor(self.normalColor, for: .normal)
                }
            } else {
                if view.tag == tag + (constNum2 - constNum1) {
                    view.backgroundColor = self.selectColor
                    view.isHidden = false
                } else {
                    view.backgroundColor = self.normalColor
                    view.isHidden = true
                    
                }
            }

        }
    }
    
    func refreshLineViewHeight(height: CGFloat) {
        for view in self.subviews {
            
            if view.isKind(of: UIButton.self){
          
            } else {
                view.height = height
                view.top = self.height - height
            }
            
        }
    }
    
    func refreshLineViewWidth(width: CGFloat) {
        
        for view in self.subviews {
         
            if view.isKind(of: UIButton.self){
                
            } else {
                
                view.width = width
                
                let temp = self.viewWithTag(view.tag - (constNum2 - constNum1))
                
                if let temp = temp {
                    view.centerX = temp.centerX
                }
            }
        }
    }
}

