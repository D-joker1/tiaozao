//
//  mimashezhi_View.swift
//  tiaozao
//
//  Created by david on 2017/8/5.
//  Copyright © 2017年 david. All rights reserved.
//

import UIKit

class mimashezhi_View: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var zhanghao: UITextField!
    @IBOutlet weak var mima: UITextField!
    @IBOutlet weak var chongfumima: UITextField!
    @IBOutlet weak var touxiang: UIImageView!
    
    var picker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //图片外观选择为圆形
        let imageview = touxiang
        imageview?.layer.cornerRadius = (imageview?.frame.width)!/2
        imageview?.clipsToBounds = true
        
    }
    //头像设置
    @IBAction func xuanzetouxiang(_ sender: Any) {
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        self.present(picker,animated: true,completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        self.dismiss(animated: true, completion: nil)
        touxiang.image = info[UIImagePickerControllerEditedImage] as? UIImage
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    

    //关闭键盘
    @IBAction func zhanghaojp(_ sender: Any) {
        zhanghao.resignFirstResponder()
    }
    @IBAction func mimajp(_ sender: Any) {
        mima.resignFirstResponder()
    }
    @IBAction func chongfumimajp(_ sender: Any) {
        chongfumima.resignFirstResponder()
    }
    //完成
    @IBAction func wancheng(_ sender: Any) {
        let zhanghaotext = zhanghao.text
        let mimatext = mima.text
        if zhanghao.text!.isEmpty || mima.text!.isEmpty || chongfumima.text!.isEmpty {
            let alertController1 = UIAlertController(title:"提示",message:"请填写账号和密码！",preferredStyle:UIAlertControllerStyle.alert)
            let action1 = UIAlertAction(title:"确定",style:UIAlertActionStyle.default,handler:nil)
            alertController1.addAction(action1)
            self.present(alertController1,animated:true,completion: nil)
        }else if mima.text != chongfumima.text{
            let alertController2 = UIAlertController(title:"提示",message:"两次输入密码不一致！",preferredStyle:UIAlertControllerStyle.alert)
            let action2 = UIAlertAction(title:"确定",style:UIAlertActionStyle.default,handler:nil)
            alertController2.addAction(action2)
            self.present(alertController2,animated:true,completion: nil)
            chongfumima.text! = ""
        }else if((mimatext?.characters.count)! < 6 ){
            let alertController3 = UIAlertController(title:"提示",message:"请设置大于等于6位的密码！",preferredStyle:UIAlertControllerStyle.alert)
            let action3 = UIAlertAction(title:"确定",style:UIAlertActionStyle.default,handler:nil)
            alertController3.addAction(action3)
            self.present(alertController3,animated:true,completion: nil)
            mima.text! = ""
            chongfumima.text! = ""
        }else{
            print(zhanghaotext)
            print(mimatext)
            //手机号传值
            let defaults1 = UserDefaults.standard
            let shoujihao = defaults1.value(forKey: "mobile")
            print(shoujihao!)
            //sheng传值
            let defaults2 = UserDefaults.standard
            let sheng = defaults2.value(forKey: "sheng")
            print(sheng!)
            //shi传值
            let defaults3 = UserDefaults.standard
            let shi = defaults3.value(forKey: "shi")
            print(shi!)
            //xuexiao传值
            let defaults4 = UserDefaults.standard
            let xuexiao = defaults4.value(forKey: "xuexiao")
            print(xuexiao!)
            //xingming传值
            let defaults5 = UserDefaults.standard
            let xingming = defaults5.value(forKey: "xingming")
            print(xingming!)

            //xuehao传值
            let defaults6 = UserDefaults.standard
            let xuehao = defaults6.value(forKey: "xuehao")
            print(xuehao!)

            //youxiang传值
            let defaults7 = UserDefaults.standard
            let youxiang = defaults7.value(forKey: "youxiang")
            print(youxiang!)

            //发送注册信息导服务器
            let user = AVUser()
            user.username = zhanghaotext
            user.email = youxiang as! String
            user.password = mimatext
            user["phone"] = shoujihao
            user["province"] = sheng
            user["city"] = shi
            user["school"] = xuexiao
            //转换数据头像到服务器
            let avaData = UIImageJPEGRepresentation(touxiang.image!, 0.5)
            let avaFile = AVFile(name:"touxiang.jpg",data:avaData!)
            user["touxiang"] = avaFile
            //数据提交
            user.signUpInBackground {(success:Bool, error:Error? ) in
                if success {
                    print("用户注册成功")
                }else{
                    print(error?.localizedDescription)
                }
            }
        }
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
