//
//  ChoosePhotoViewController.swift
//  FlairMedia
//
//  Created by huwenqiang on 15/7/24.
//  Copyright (c) 2015年 refineit. All rights reserved.
//

import UIKit

protocol ChoosePhotoViewControllerDelegate{
    //退出选取照片界面
    func closeChooseImagePicker()
    //选取图片成功
    func chooseImageSucceed(image:UIImage)
    
}

class ChoosePhotoViewController: UIViewController ,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    var delegate:ChoosePhotoViewControllerDelegate?
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.clearColor()
        self.automaticallyAdjustsScrollViewInsets = false
    }

    //从storyboard中加载布局
    class func viewControllerFromSrotyboard() -> ChoosePhotoViewController{
        var mstoryboard:UIStoryboard = UIStoryboard(name: "function", bundle: nil)
        var viewController = mstoryboard.instantiateViewControllerWithIdentifier("ChoosePhotoViewController") as! ChoosePhotoViewController
        return viewController
    }
    
    @IBAction func takePhoto(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(.Camera){
            var sourceType = UIImagePickerControllerSourceType.Camera
            let imagePicker:UIImagePickerController = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true//true表示拍照货选择完照片进入编辑模式
            imagePicker.sourceType = sourceType
            self.presentViewController(imagePicker, animated: true
                ) { () -> Void in
                    
            }
        }else{
            self.view .makeToast(message: "设备不支持拍照" , duration: 1, position: HRToastPositionCenter)
        }
        
       
    }
 
    @IBAction func pickPhoto(sender: AnyObject) {
        var sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        let imagePicker:UIImagePickerController = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true//true表示拍照货选择完照片进入编辑模式
        imagePicker.sourceType = sourceType
        self.presentViewController(imagePicker, animated: true
            ) { () -> Void in
                
        }
       
    }

 
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
//        var imageToSave:UIImage
//        var info =  editingInfo as NSDictionary;
//        imageToSave = info.objectForKey(UIImagePickerControllerEditedImage) as! UIImage
        if(delegate != nil){
            delegate?.closeChooseImagePicker()
            delegate?.chooseImageSucceed(image)
       
        }
        self.dismissViewControllerAnimated(true, completion: { () -> Void in
            
        })
    }
    
   
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: { () -> Void in
            
        })
    }
    
    @IBAction func closeImagePicker(sender: AnyObject) {
        if(delegate != nil){
            delegate?.closeChooseImagePicker()
        }
        
    }
    
    
}
