//
//  CountDownViewController.swift
//  LearnSwift
//
//  Created by huwenqiang on 15/7/27.
//  Copyright (c) 2015年 huwenqiang. All rights reserved.
//

import UIKit

class CountDownViewController: UIViewController {

    var timer:NSTimer?
    var count:Int = 100
    
    @IBOutlet weak var labelTime: UILabel!
 

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "倒计时"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    @IBAction func countStart(sender: AnyObject) {
        if (timer != nil) {
            timer?.invalidate()
        }
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "countDown", userInfo: nil, repeats: true)
       
    }

  
    @IBAction func countStop(sender: AnyObject) {
        timer?.invalidate()
        timer = nil
    }
    
    func countDown(){
        if(count == 0){
            timer?.invalidate()
            timer = nil
            return
        }
        count--
        
        labelTime.text = String(count)
    }

}
