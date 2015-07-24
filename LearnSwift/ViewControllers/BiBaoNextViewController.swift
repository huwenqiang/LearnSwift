//
//  BiBaoNextViewController.swift
//  LearnSwift
//
//  Created by huwenqiang on 15/7/23.
//  Copyright (c) 2015年 huwenqiang. All rights reserved.
//
/**
*  闭包表达式
    {
        (parameters)->returnType in
            statements
    }
*/
import UIKit

class BiBaoNextViewController: UIViewController {

    /// 定义闭包的参数及返回值
    typealias sendValueClosure=(string:String)->Void
    
    var myClosure:sendValueClosure?
    
    @IBOutlet weak var inputTextField: UITextField!
    
    class func viewControllerFromStoryboard() -> BiBaoNextViewController {
        var storyboard :UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        var viewController:BiBaoNextViewController = storyboard.instantiateViewControllerWithIdentifier("BiBaoNextViewController") as! BiBaoNextViewController
        return viewController;
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //需要传入上个界面的someFunctionThatTakesAClosure函数指针
    func initWithClosure(closure:sendValueClosure?){
        //将函数指针赋值给myClosure闭包，该闭包中涵盖了someFunctionThatTakesAClosure函数中的局部变量等的引用
        myClosure = closure
    }

    /**
    点击返回事件
    
    :param: sender
    */
    @IBAction func goToBack(sender: AnyObject) {
        var content : String! = inputTextField.text;
        action(content)
    }
    
    func action(content:String){
        if (myClosure != nil) {
            //闭包隐式调用someFunctionThatTakesAClosure函数：回调。
            myClosure!(string: content)
        }
        self.navigationController?.popViewControllerAnimated(true)
    }
 
}
