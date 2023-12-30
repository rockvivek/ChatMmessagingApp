//
//  ViewController.swift
//  ChatMessangerApp
//
//  Created by Vivek Shrivastava on 18/12/23.
//

import UIKit

class ConersationsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //background  color
        self.view.backgroundColor = .red
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if !isUserLogin() {
            //show Login page
            presentLoginPage()
        }
    }
    
    func isUserLogin() -> Bool{
        return UserDefaults.standard.bool(forKey: Keys.UserDefaults.isUserLoggedIn)
    }
    
    func presentLoginPage() {
        let vc = LoginViewController()
        let nav = UINavigationController(rootViewController: vc)
        vc.modalPresentationStyle = .overCurrentContext //or .overFullScreen for transparency
        self.present(nav, animated: true, completion: nil)
    }


}

