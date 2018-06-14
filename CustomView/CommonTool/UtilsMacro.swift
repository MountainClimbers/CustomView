//
//  UtilsMacro.swift
//  UPMApp
//
//  Created by swlcool on 2018/1/22.
//

import UIKit

//MARK: - iOS约定规范 ***********************************************************
/*
 
 JWSwiftBizCardConsts 全局常量
 JWBizCardNew-Prefix.pch swift调oc，请把头文件放这里
 #import "JWBizCardNew-Swift.h" oc调swift
 JWSwiftCommonHelper（JWCommonHelper） 工具类方法
 Swift扩展位于目录扩展文件夹（oc分类位于目录Category文件夹）
 OC数据库调用位于目录Dao文件夹
 
 UI命名规范,均作为后缀
 
 Lbl UILabel
 Img UIImageView
 Btn UIButton
 Vi UIView
 JWSwiftxxxVC 创建控制器
 Tf UITextField
 ScVi UIScrollView
 Tv UITextView
 TableVi UITableView
 
 
 数据结构命名规范，均作为后缀
 
 Arr 数组，可变数组
 Dic 字典，可变字典
 Str 字符串
 Int 整型
 Dob Double
 Flt Float
 IsXxx Bool
 
 枚举(style、type) 统一写在JWBizCardConsts.h中
 
 通知名,Notification作为后缀
 let RolodexListRefreshNotification = "RolodexListRefreshNotification"
 
 如需补充自行添加
 */


/**************************************屏幕尺寸*******************************************/

//屏幕的高
let SCREEN_WIDTH = UIScreen.main.bounds.size.width
//屏幕的宽
let SCREEN_HEIGHT =  IS_IPHONEX ? (UIScreen.main.bounds.size.height-34) : UIScreen.main.bounds.size.height
//顶部navBar高度
let NAVBARTOP_HEIGHT: CGFloat = 20.0
//navBar高度不包含顶部
let NAVBAR_HEIGHTUNTOP: CGFloat = IS_IPHONEX ? 68.0:44.0
//顶部navBar高度
let NAVBAR_HEIGHT: CGFloat = IS_IPHONEX ? 88.0:64.0
//底部tabbar高度
let TABBAR_HEIGHT: CGFloat = 49.0
//是否是iphoneX
let IS_IPHONEX = (UIScreen.main.bounds.size.height == 812) ? true :false
//底部的高
let BottomHeight: CGFloat = IS_IPHONEX ? 34.0 : 0.0

/**************************************颜色设置*******************************************/

//颜色配置
func RGBCOLOR(r:CGFloat,_ g:CGFloat,_ b:CGFloat) -> UIColor
{
    return UIColor(red: (r)/255.0, green: (g)/255.0, blue: (b)/255.0, alpha: 1.0)
}

//颜色配置
func RGBACOLOR(r:CGFloat,_ g:CGFloat,_ b:CGFloat,_ a:CGFloat) ->UIColor
{
    return UIColor(red: (r)/255.0, green: (g)/255.0, blue: (b)/255.0, alpha:a)
}

//UIColor
func UIColorFromRGB(rgbValue: UInt) -> UIColor {
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}

//验证码不让点时颜色
let greyColor = RGBCOLOR(r:0xcc,0xcc,0xcc)

let kSectionColor = UIColorFromRGB(rgbValue: 0xeeeeee)

/**************************************所有的三方注册key值*******************************************/

//腾讯TIM
let TIMAppId = 1400062871
let TIMaccountType = "20450"

//信鸽
let XinGeKey = ""

//阿里云
let AliKeyId = "LTAIP319vOIh8NM3"
let AliSecret = "ToIfEgzsdg2pS0ger9r6rImIchH30e"
let AliIMAGE_HOST = "http://upmim.oss-cn-hangzhou.aliyuncs.com/";
let Aliendpoint = "http://oss-cn-hangzhou.aliyuncs.com/";
let AliBUCKET = "upmim";


/*****************************************颜色配置*******************************************/

//验证码发送时背景色
let greenColor = RGBCOLOR(r:0x63,0x8c,0x09)

//MARK: - 颜色 #333333
let threeGreyColor = RGBCOLOR(r:0x33,0x33,0x33)

//MARK: - 颜色 #666666
let sixGreyColor = RGBCOLOR(r:0x66,0x66,0x66)

//MARK: - 颜色 #999999
let nineGreyColor = RGBCOLOR(r:0x99,0x99,0x99)

//MARK: - 页面背景颜色 #eeeeee
let VCBackGroudColor = RGBCOLOR(r:0xee,0xee,0xee)

//MARK: - 颜色 #3366cc
let greenTwoColor = RGBCOLOR(r:0x33,0x66,0xcc)

//MARK: - 聊天背景 #f8f8f8
let VCMessageBackColor = RGBCOLOR(r:0xf8,0xf8,0xf8)

/**************************************字体大小设置*******************************************/


func Font(size:CGFloat, isBold:Bool) -> UIFont {
    if isBold {
        return UIFont.boldSystemFont(ofSize: size)
    } else {
        return UIFont.systemFont(ofSize: size)
    }
}


/**************************************圆角大小设置*******************************************/
let cornerRadiusWidth:CGFloat = 3.0

//计算文字高度
func getTextHeight(textStr:String,font:UIFont,width:CGFloat) -> CGFloat {

    let normalText: NSString = textStr as NSString
    let size = CGSize.init(width: width, height:1000)

    let dic = NSDictionary(object: font, forKey: NSAttributedStringKey.font as NSCopying)
    
    let stringSize  = normalText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic as? [NSAttributedStringKey : Any], context: nil).size
    return stringSize.height
}

/**************************************自定义Log*******************************************/

func UPMPrint<T>(_ message : T, file : String = #file, functionName : String = #function, lineNumber : Int = #line) {
    
    #if DEBUG
        
        let fileName = (file as NSString).lastPathComponent
        print("\(fileName) \(functionName) [Line:\(lineNumber)] \(message)")
        
    #else
        
    #endif
}



