//
//  forget_mima_ViewController.swift
//  tiaozao
//
//  Created by david on 2017/8/9.
//  Copyright © 2017年 david. All rights reserved.
//

import UIKit

class forget_mima_ViewController: UIViewController {

    @IBOutlet weak var emailtxt: UITextField!
    @IBOutlet weak var resetbtn: UIButton!
    @IBOutlet weak var cancelbtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    @IBAction func resetbtn_clicked(_ sender: Any) {
        self.view.endEditing(true)
        if emailtxt.text!.isEmpty {
            let alert = UIAlertController(title:"请注意",message:"电子邮箱不能为空",preferredStyle: .alert)
            let ok = UIAlertAction(title:"ok",style: .cancel,handler:nil)
            alert.addAction(ok)
            self.present(alert,animated: true,completion: nil)
        }
        AVUser.requestPasswordResetForEmail(inBackground: emailtxt.text!) { (success:Bool,error:Error?) in
            if success {
                let alert = UIAlertController(title:"请注意",message:"重置密码连接已经发送到您的电子邮箱！",preferredStyle: .alert)
                let ok = UIAlertAction(title:"ok",style: .default,handler:{ (_) in
                self .dismiss(animated: true, completion: nil) })
                alert.addAction(ok)
                self.present(alert,animated: true,completion: nil)
            }else{
                print(error?.localizedDescription)
            }
        }
    }
    @IBAction func cancelbtn_clicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
