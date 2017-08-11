//
//  mobile_register.swift
//  tiaozao
//
//  Created by 耿直的佳哥从不胡说八道 on 2017/7/31.
//  Copyright © 2017年 david. All rights reserved.
//

import UIKit

class mobile_register_ViewController: UIViewController {


    @IBOutlet var mobile: UITextField!
    @IBOutlet weak var code: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    @IBAction func error(_ sender: Any) {
        var flag = 0
        //没有填写手机号
        let phoneNumber = mobile.text
        let mobileNumber = "^(13[0-9]|15[0-9]|18[0-9]|17[0-9]|147)\\d{8}$"
        let regexMobile = NSPredicate(format: "SELF MATCHES %@",mobileNumber)
        if phoneNumber?.characters.count == 0 {
            let alertController1 = UIAlertController(title:"提示",message:"还没输入手机号哦！",preferredStyle:UIAlertControllerStyle.alert)
            let action1 = UIAlertAction(title:"确定",style:UIAlertActionStyle.default,handler:nil)
            alertController1.addAction(action1)
            self.present(alertController1,animated:true,completion: nil)
        }
        //手机号格式错误
        else if regexMobile.evaluate(with: phoneNumber) == false {
            let alertController2 = UIAlertController(title:"提示",message:"手机号格式错误！",preferredStyle:UIAlertControllerStyle.alert)
            let action2 = UIAlertAction(title:"确定",style:UIAlertActionStyle.default,handler:nil)
            alertController2.addAction(action2)
            self.present(alertController2,animated:true,completion: nil)
        }
        else if(flag == 0){
            let alertController2 = UIAlertController(title:"提示",message:"未进行验证或验证码输入错误！",preferredStyle:UIAlertControllerStyle.alert)
            let action2 = UIAlertAction(title:"确定",style:UIAlertActionStyle.default,handler:nil)
            alertController2.addAction(action2)
            self.present(alertController2,animated:true,completion: nil)

        }
        else{
            let sb = UIStoryboard(name:"Main", bundle: nil)
            let vc1 = sb.instantiateViewController(withIdentifier: "zhuce_xuexiaozhuce") as UIViewController
            self.present(vc1, animated: true, completion: nil)
            //传值给 mimashezhi_View
            let defaults = UserDefaults.standard
            defaults.setValue(mobile.text, forKey: "mobile")
            defaults.synchronize()
            let detail_vc = mimashezhi_View()
            self.present(detail_vc, animated: true, completion: nil)
        }
        SMSSDK.commitVerificationCode("86", phoneNumber: mobile.text, zone: code.text) { (error) in
            if error == nil {
                print("验证成功")
                flag = 1
            } else {
                print("验证失败")
                flag = 0
            }
        }
    }

    @IBAction func sendCode(_ sender: UIButton) {
        SMSSDK.getVerificationCode(by: SMSGetCodeMethodSMS, phoneNumber: mobile.text, zone: "86") { (error:Error?) in
            if error == nil {
                print("获取验证码成功")
            } else {
                print("错误描述\(String(describing:error))")
                    let alertController1 = UIAlertController(title:"提示",message:"验证码发送失败",preferredStyle:UIAlertControllerStyle.alert)
                    let action1 = UIAlertAction(title:"确定",style:UIAlertActionStyle.default,handler:nil)
                    alertController1.addAction(action1)
                    self.present(alertController1,animated:true,completion: nil)
            }
        }
    }
}
/*    @IBAction func sumbitCode(_ sender: UIButton) {
        SMSSDK.commitVerificationCode("86", phoneNumber: mobile.text, zone: code.text) { (error) in
            if error == nil {
                print("验证成功")
            } else {
                print("验证失败")
            }
        }
    }*/
    
    
 /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
}
 */

