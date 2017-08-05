//
//  s_info_register_ViewController.swift
//  tiaozao
//
//  Created by david on 2017/8/5.
//  Copyright © 2017年 david. All rights reserved.
//

import UIKit

class s_info_register_ViewController: UIViewController {

    @IBOutlet weak var xingming: UITextField!
    @IBOutlet weak var xuehao: UITextField!
    @IBOutlet weak var youxiang: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //关闭键盘
//        let hideTap = UITapGestureRecognizer(target:self,action:#selector(hideKeyboardTap))
//        hideTap.numberOfTapsRequired = 1
//        self.view.isUserInteractionEnabled = true
//        self.view.addGestureRecognizer(hideTap)
        
    }
    //关闭键盘
//    func hideKeyboardTap(recognizer:UITapGestureRecognizer){
//        self.view.endEditing(true)
//    }
        //点击return关闭键盘
    @IBAction func xingmingjp(_ sender: Any) {
        xingming.resignFirstResponder()
    }
    @IBAction func xuehaojp(_ sender: Any) {
        xuehao.resignFirstResponder()
    }
    @IBAction func youxiangjp(_ sender: Any) {
        youxiang.resignFirstResponder()
    }

    
    //下一步
    @IBAction func xiayibu(_ sender: Any) {
        if (xingming.text?.isEmpty)! || (xuehao.text?.isEmpty)! || (youxiang.text?.isEmpty)!{
            let alertController1 = UIAlertController(title:"提示",message:"请填写全部信息！",preferredStyle:UIAlertControllerStyle.alert)
            let action1 = UIAlertAction(title:"确定",style:UIAlertActionStyle.default,handler:nil)
            alertController1.addAction(action1)
            self.present(alertController1,animated:true,completion: nil)
        }else{
            let sb = UIStoryboard(name:"Main", bundle: nil)
            let vc1 = sb.instantiateViewController(withIdentifier: "zhuce_mimashezhi") as UIViewController
            self.present(vc1, animated: true, completion: nil)
            //传值
            let defaults1 = UserDefaults.standard
            defaults1.setValue(xingming.text, forKey: "xingming")
            defaults1.synchronize()
            let detail_vc1 = mimashezhi_View()
            self.present(detail_vc1, animated: true, completion: nil)
            //传值
            let defaults2 = UserDefaults.standard
            defaults2.setValue(xuehao.text, forKey: "xuehao")
            defaults2.synchronize()
            let detail_vc2 = mimashezhi_View()
            self.present(detail_vc2, animated: true, completion: nil)
            //传值
            let defaults3 = UserDefaults.standard
            defaults3.setValue(youxiang.text, forKey: "youxiang")
            defaults3.synchronize()
            let detail_vc3 = mimashezhi_View()
            self.present(detail_vc3, animated: true, completion: nil)
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
