//
//  LoginViewController.swift
//  ChatMessangerApp
//
//  Created by Vivek Shrivastava on 28/12/23.
//

import UIKit

class LoginViewController: UIViewController {

    private let emailTF: UITextField = {
        let tf = UITextField()
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.returnKeyType = .continue
        tf.layer.cornerRadius = 10
        tf.layer.borderColor = UIColor.lightGray.cgColor
        tf.layer.borderWidth = 1
        tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        tf.leftViewMode = .always
        tf.backgroundColor = .white
        tf.placeholder = "Email Address...."
        return tf
    }()
   
    private let passwordTF: UITextField = {
        let tf = UITextField()
        tf.autocapitalizationType = .none
        tf.isSecureTextEntry = true
        tf.autocorrectionType = .no
        tf.returnKeyType = .done
        tf.layer.cornerRadius = 10
        tf.layer.borderColor = UIColor.lightGray.cgColor
        tf.layer.borderWidth = 1
        tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        tf.leftViewMode = .always
        tf.backgroundColor = .white
        tf.placeholder = "Password...."
        return tf
    }()
    
    private let scrollView: UIScrollView =  {
        let scrollView: UIScrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()
    
    private let appLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo1")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let loginButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Log In", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .link
        btn.layer.cornerRadius = 10
        btn.layer.masksToBounds = true
        btn.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title =  "Log In"
        self.view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Register", style: .done, target: self, action: #selector(didTapRegisterButton))
        
        setupUI()
    }
    
    func setupUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(appLogoImageView)
        scrollView.addSubview(emailTF)
        scrollView.addSubview(passwordTF)
        scrollView.addSubview(loginButton)
        
        emailTF.delegate = self
        passwordTF.delegate = self
        
        loginButton.addTarget(self,
                              action: #selector(didTapLoginButton),
                              for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //adding scrollView
        scrollView.frame = CGRect(x: 0,
                                 y: 0,
                                 width: view.width,
                                 height: view.height)
        //adding Logo
        let size = scrollView.width / 3
        appLogoImageView.frame = CGRect(x: (scrollView.width - size) / 2,
                                 y: 30,
                                 width: size,
                                 height: size)
        //Adding EmailTF
        emailTF.frame = CGRect(x: view.left + 25,
                               y: appLogoImageView.bottom + 15,
                               width: (view.width - 50) ,
                               height: 40)
        //Adding PasswordTF
        passwordTF.frame = CGRect(x: view.left + 25,
                               y: emailTF.bottom + 15,
                               width: (view.width - 50) ,
                               height: 40)
        //Adding loginButton
        loginButton.frame = CGRect(x: view.left + 25,
                               y: passwordTF.bottom + 25,
                               width: (view.width - 50) ,
                               height: 40)
    }
    
    @objc func didTapLoginButton() {
        print("Login Button Tapped")
        if isEmailAndPasswordValid() {
            //login with firebase
        }
        else {
            //show alert
            showLoginAlert()
            passwordTF.text = ""
        }
    }
    
    func isEmailAndPasswordValid() -> Bool{
         //check if email is valid and and password is valid and password is 8 character long
        guard let email = emailTF.text, !email.isEmpty,
              let password = passwordTF.text, !password.isEmpty, password.count >= 8 else {
            return false
        }
        return true
    }
    
    func showLoginAlert() {
        let alert = UIAlertController(title: "Woops!", message: "Please Enter valid Email id and password.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    @objc func didTapRegisterButton() {
        let vc = RegisterViewController()
        vc.title = "Register"
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField!) -> Bool {   //delegate method
        if textField == emailTF {
            passwordTF.becomeFirstResponder()
        }
        else if textField == passwordTF {
            didTapLoginButton()
        }
        return true
    }
}
