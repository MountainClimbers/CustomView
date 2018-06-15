//
//  QJHItemSortView.swift
//  CustomView
//
//  Created by qj.huang on 2018/6/14.
//  Copyright © 2018年 qjmac. All rights reserved.
//

import UIKit

protocol QJHItemSortViewDelegate {
    /**
     viewTag 0 1 2
     tagFlag 0 代表顺序 1 代表逆序
     */
    func ItemSortViewBtnTapFlag(viewTag:NSInteger, tagFlag:NSInteger) //点击事件
    
    
}

class QJHItemSortView: UIView {
    
    let constNum = 10
    
    var _delegate: QJHItemSortViewDelegate?
    
    var delegate: QJHItemSortViewDelegate?{
        
        get{
            return _delegate
        }
        
        set(deleg) {
            _delegate = deleg
            
            triggerButton(tag: _selectIndex)
        }
        
    }
    
    //10 11 12 10代表第一个按钮 11代表第二个按钮
    var _selectIndex: NSInteger = 10
    
    var selectIndex: NSInteger {
        get{
            return _selectIndex
        }
        set(flag) {
            _selectIndex = flag
            
            if self.delegate != nil {
                triggerButton(tag: flag)
            }
        }
    }
    
    var _titleLabelSelectColor: UIColor?
    var titleLabelSelectColor: UIColor? {
        get{
            return _titleLabelSelectColor != nil ? _titleLabelSelectColor : UIColorFromRGB(rgbValue: 0x3399ff)
        }
        
        set(color){
            _titleLabelSelectColor = color
        }
    }
    
    var _titleLabelNormalColor: UIColor?
    var titleLabelNormalColor: UIColor? {
        get{
            return _titleLabelNormalColor != nil ? _titleLabelNormalColor : UIColorFromRGB(rgbValue: 0x333333)
        }
        
        set(color){
            _titleLabelNormalColor = color
        }
    }
    
    var stateFlag = [0,0,0] //操作flag
    
    var imgArr = ["button_px_normal","button_px_up","button_px_down"]
    
    private var _dataArr: [String]?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(frame: CGRect, arr: [String]?) {
        super.init(frame: frame)
        self.frame = frame
        _dataArr = arr != nil ? arr! : ["公司名","创建时间","更新时间"]
        initView(arr: _dataArr!)
        
    }
    
    func initView(arr:[String]) {
        var count = 0
        for str in arr {
            let btn = UIButton()
            btn.frame = CGRect.init(x: (self.width) / CGFloat(arr.count) * CGFloat(count), y: 0, width: (self.width) / CGFloat(arr.count), height: self.height)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
            btn.setTitle(str, for: .normal)
            let imageWidth = btn.imageView?.width
            let labelWidth = btn.titleLabel?.width
            btn.imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth!, 0, -(labelWidth!))
            btn.titleEdgeInsets = UIEdgeInsetsMake(0, -imageWidth!-15, 0, imageWidth!)
            btn.tag = count + constNum
            btn.addTarget(self, action: #selector(self.btnTap(_:)), for: .touchUpInside)
            self.addSubview(btn)
            count += 1
        }
        
        //MARK: - 设置默认选中btn
        var currentBtn:UIButton!
        for view in self.subviews {
            if view.tag == self.selectIndex {
                currentBtn = view as! UIButton
                print("stateFlag:\(stateFlag)")
                
            } else {
                print("stateFlag:\(stateFlag)")
                
            }
        }
        refreshView(sender: currentBtn ,flag: stateFlag[currentBtn.tag-constNum])
        
    }
    
    //MARK: - 触发按钮事件
    func triggerButton(tag:NSInteger) {
        
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
    
    //MARK: - 按钮事件
    @objc func btnTap(_ sender: UIButton) {
        for view in self.subviews {
            if view.tag == sender.tag {
                let num = stateFlag[sender.tag-constNum] + 1
                stateFlag[sender.tag-constNum] = num
                
                print("stateFlag:\(stateFlag)")
                
            } else {
                stateFlag[view.tag-constNum] = 0
                
                print("stateFlag:\(stateFlag)")
            }
        }
        
        refreshView(sender: sender,flag: stateFlag[sender.tag-constNum])
        
        if delegate != nil {
            
            let flag = stateFlag[sender.tag-constNum] % 2 == 0 ? 0 : 1
            delegate?.ItemSortViewBtnTapFlag(viewTag: sender.tag-constNum, tagFlag: flag)
        }
    }
    
    //MARK: - 更新button图片
    func refreshView(sender:UIButton, flag: NSInteger){
        for view in self.subviews {
            
            if view.isKind(of: UIButton.self) {
                
                if view.tag == sender.tag {
                    
                    if flag == 0 {
                        (view as! UIButton).setTitleColor(self.titleLabelNormalColor, for: .normal)
                        (view as! UIButton).setImage(UIImage.init(named: imgArr[0]), for: .normal)
                    } else {
                        if flag % 2 == 0 {
                            (view as! UIButton).setTitleColor(self.titleLabelSelectColor, for: .normal)
                            (view as! UIButton).setImage(UIImage.init(named: imgArr[1]), for: .normal)
                        } else {
                            (view as! UIButton).setTitleColor(self.titleLabelSelectColor, for: .normal)
                            (view as! UIButton).setImage(UIImage.init(named: imgArr[2]), for: .normal)
                        }
                    }
                    
                    
                } else {
                    
                    (view as! UIButton).setTitleColor(self.titleLabelNormalColor, for: .normal)
                    (view as! UIButton).setImage(UIImage.init(named: imgArr[0]), for: .normal)
                    
                }
                
            }
            
        }
        
    }
    
    
}
