//
//  SelectPhotoViewController.swift
//  LearnSwift
//
//  Created by huwenqiang on 15/7/24.
//  Copyright (c) 2015年 huwenqiang. All rights reserved.
//

import UIKit

class SelectPhotoViewController: UIViewController ,ChoosePhotoViewControllerDelegate{

    var pickerView:UIView?
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func toSelectPhoto(sender: AnyObject) {
        var pickerController:ChoosePhotoViewController = ChoosePhotoViewController.viewControllerFromSrotyboard()
        pickerController.delegate = self
        
        pickerView = pickerController.view
        pickerView?.frame=CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        self.view.addSubview(pickerView!)
        self.addChildViewController(pickerController)
    }
    
    func closeChooseImagePicker() {
        pickerView?.removeFromSuperview()
    }
    
    func chooseImageSucceed(image: UIImage) {
        imageView.image = image
    }
}
