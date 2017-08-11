//
//  login_register_ViewController.swift
//  tiaozao
//
//  Created by david on 2017/7/21.
//  Copyright © 2017年 david. All rights reserved.
//

import UIKit

class login_register_ViewController: UIViewController {
    

    @IBOutlet var zhanghu: UITextField!
    @IBOutlet var mima: UITextField!

    @IBOutlet weak var label: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        label.font = UIFont(name:"Pacifico",size:25)
    }
   
    
    //点击return关闭键盘
    @IBAction func zhanghuclose(_ sender: Any) {
        zhanghu.resignFirstResponder()
    }
    @IBAction func mimaclose(_ sender: Any) {
        mima.resignFirstResponder()
    }
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //没有填写账号或密码
    @IBAction func no_id(_ sender: Any) {
        let zhanghutext = zhanghu.text
        if(zhanghutext?.characters.count == 0){
            let alertController1 = UIAlertController(title:"提示",message:"  请输入账号！",preferredStyle:UIAlertControllerStyle.alert)
            let action1 = UIAlertAction(title:"确定",style:UIAlertActionStyle.default,handler:nil)
            alertController1.addAction(action1)
            self.present(alertController1,animated: true,completion: nil)
        }
        let mimatext = mima.text
        if(mimatext?.characters.count == 0){
            let alertController2 = UIAlertController(title:"提示",message:"  请输入密码！",preferredStyle:UIAlertControllerStyle.alert)
            let action2 = UIAlertAction(title:"确定",style:UIAlertActionStyle.default,handler:nil)
            alertController2.addAction(action2)
            self.present(alertController2,animated: true,completion: nil)
        }
        //密码达不到要求的6位
        let mimatext2 = mima.text
        if((mimatext2?.characters.count)! <= 5){
            let alertController3 = UIAlertController(title:"提示",message:"  请输入6位密码！",preferredStyle:UIAlertControllerStyle.alert)
            let action3 = UIAlertAction(title:"确定",style:UIAlertActionStyle.default,handler:nil)
            alertController3.addAction(action3)
            self.present(alertController3,animated: true,completion: nil)
        }
        AVUser.logInWithUsername(inBackground: zhanghu.text!, password: mima.text!) { (user:AVUser?,error:Error?) in
            if error ==  nil {
                UserDefaults.standard.set(user!.username, forKey: "username")
                UserDefaults.standard.synchronize()
                let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.login()
            }
        }
        
        }

    
    

    
//    @IBAction func zhuce(_ sender: Any) {
//        let sb1 = UIStoryboard(name:"Main", bundle: nil)
//        let vc1 = sb1.instantiateViewController(withIdentifier: "zhuce-shoujizhuce") as UIViewController
//        self.present(vc1, animated: true, completion: nil)
//    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
