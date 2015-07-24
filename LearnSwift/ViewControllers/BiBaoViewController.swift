//
//  BiBaoViewController.swift
//  LearnSwift
//
//  Created by huwenqiang on 15/7/23.
//  Copyright (c) 2015年 huwenqiang. All rights reserved.
//

import UIKit

class BiBaoViewController: UIViewController {
    
    @IBOutlet weak var buttonNext: UIButton!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "闭包"
        
    }
    
    @IBAction func pushToNext(sender: AnyObject) {
        let second = BiBaoNextViewController.viewControllerFromStoryboard()
        second.initWithClosure(somFunctionThatTakeBack)
        self.navigationController?.pushViewController(second, animated: true)
    }
    
    func somFunctionThatTakeBack(string:String)->Void{
//        print("返回的数据为",string)
        buttonNext.setTitle(string, forState: UIControlState.Normal)
    }
}
