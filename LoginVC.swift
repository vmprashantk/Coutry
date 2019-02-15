//
//  LoginVC.swift

//
//  Created by Prashant on 15/08/18.
//  Copyright © 2018 DivySoft. All rights reserved.
//

import UIKit


class LoginVC: UIViewController,countryProtocol{
    
    
    
    @IBOutlet var imgViewDropDown: UIImageView!
    @IBOutlet var btnFlag: UIButton!
    @IBOutlet var lblCountryCode: UILabel!
 
    
    var countryCallingCode = String()
 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        objSignupViewModel.getCurrentCountry { (flag,code) in
            
            btnFlag.setTitle(flag, for: .normal)
            countryCallingCode = code
            lblCountryCode.text = "+\(code)"
        }
        // Do any additional setup after loading the view.
    }
    
    func getCountry(data:CountryModel){
        
        btnFlag.setTitle(data.countryFlag, for: .normal)
        btnFlag.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
        lblCountryCode.text = "+\(data.callingCode)"
        countryCallingCode = data.callingCode
        
        
    }
    
    
    @IBAction func btnFlagAction(_ sender: Any) {
        
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CountryVC") as! CountryVC
        vc.objDelegate = self
        self.navigationController?.present(vc, animated: true, completion: nil)
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
