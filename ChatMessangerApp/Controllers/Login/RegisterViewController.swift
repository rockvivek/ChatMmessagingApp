//
//  RegisterViewController.swift
//  ChatMessangerApp
//
//  Created by Vivek Shrivastava on 28/12/23.
//

import UIKit

enum RegistrationError{
    case blankEmail
    case inValidEmail
    case blankFirstName
    case firstNameCountLimit
    case blankLastName
    case lastNameCountLimit
    case blankPassword
    case invalidPassword
    case didNotMatchPassword
    case none
    case nilField
}

class RegisterViewController: UIViewController {
    
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
    private let firstNameTF: UITextField = {
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
        tf.placeholder = "First Name...."
        return tf
    }()
    private let lastNameTF: UITextField = {
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
        tf.placeholder = "Last Name...."
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
    
    private let confPasswordTF: UITextField = {
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
        tf.placeholder = "Confirm Password...."
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
    
    private let registerButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Register", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .systemGreen
        btn.layer.cornerRadius = 10
        btn.layer.masksToBounds = true
        btn.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title =  "Create Account"
        self.view.backgroundColor = .white
        
        setupUI()
    }
    
    func setupUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(appLogoImageView)
        scrollView.addSubview(emailTF)
        scrollView.addSubview(firstNameTF)
        scrollView.addSubview(lastNameTF)
        scrollView.addSubview(passwordTF)
        scrollView.addSubview(confPasswordTF)
        scrollView.addSubview(registerButton)
        
        emailTF.delegate = self
        passwordTF.delegate = self
        firstNameTF.delegate = self
        lastNameTF.delegate = self
        confPasswordTF.delegate = self
        
        registerButton.addTarget(self,
                              action: #selector(didTapRegisterButton),
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
        //Adding FirstNameTF
        firstNameTF.frame = CGRect(x: view.left + 25,
                               y: emailTF.bottom + 15,
                               width: (view.width - 50) ,
                               height: 40)
        //Adding LastNameTF
        lastNameTF.frame = CGRect(x: view.left + 25,
                               y: firstNameTF.bottom + 15,
                               width: (view.width - 50) ,
                               height: 40)
        //Adding PasswordTF
        passwordTF.frame = CGRect(x: view.left + 25,
                               y: lastNameTF.bottom + 15,
                               width: (view.width - 50) ,
                               height: 40)
        //Adding Confirm PasswordTF
        confPasswordTF.frame = CGRect(x: view.left + 25,
                               y: passwordTF.bottom + 15,
                               width: (view.width - 50) ,
                               height: 40)
        //Adding loginButton
        registerButton.frame = CGRect(x: view.left + 25,
                               y: confPasswordTF.bottom + 25,
                               width: (view.width - 50) ,
                               height: 40)
    }
    
    @objc func didTapRegisterButton() {
        print("Login Button Tapped")
        let (isVaildFields, errorType) = isEmailAndPasswordValid()
        if isVaildFields{
            //register with firebase
        }
        else {
            //show alert
            showLoginAlert(errorType: errorType)
            passwordTF.text = ""
            confPasswordTF.text = ""
        }
    }
    
    func isEmailAndPasswordValid() -> (Bool, RegistrationError){
        var errorType: RegistrationError = .none
        var isValidFields: Bool = true
         //check if email is valid and and password is valid and password is 8 character long
        guard let email = emailTF.text,
              let firstName = firstNameTF.text,
              let lastName = lastNameTF.text,
              let password = passwordTF.text,
              let confPassword = confPasswordTF.text else {
            return (false, .nilField)
        }
        if email.isEmpty {
            isValidFields = false
            errorType = .blankEmail
        }
        else if !isValidEmail(email) {
            isValidFields = false
            errorType = .inValidEmail
        }
        else if firstName.isEmpty {
            isValidFields = false
            errorType = .blankFirstName
        }
        else if lastName.isEmpty {
            isValidFields = false
            errorType = .blankLastName
        }
        else if password.isEmpty {
            isValidFields = false
            errorType = .blankPassword
        }
        else if firstName.count > 10 {
            isValidFields = false
            errorType = .firstNameCountLimit
        }
        else if lastName.count > 10 {
            isValidFields = false
            errorType = .lastNameCountLimit
        }
        else if !isValidPassword(password){
            isValidFields = false
            errorType = .invalidPassword
        }
        else if password != confPassword {
            isValidFields = false
            errorType = .didNotMatchPassword
        }
        return (isValidFields, errorType)
    }
    
    func showLoginAlert(errorType: RegistrationError) {
        let message = errorMessage(errorType: errorType)
        let alert = UIAlertController(title: "Woops!", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    func errorMessage(errorType: RegistrationError) -> String {
        switch errorType {
        case .blankEmail:
            return "Email Field is required."
        case .blankFirstName:
            return "FirstName Field is required."
        case .blankLastName:
            return "LastName Field is required."
        case .blankPassword:
            return "Password Field is required."
        case .didNotMatchPassword:
            return "Password and confirm password should be same."
        case .firstNameCountLimit:
            return "First Name should be maximum of 10 characters long."
        case .inValidEmail:
            return "Please enter a valid email."
        case .invalidPassword:
            return "Please enter a valid password."
        case .lastNameCountLimit:
            return "Last Name should be maximum of 10 characters long."
        case .nilField:
            return "Something went wrong! Please try again."
        case .none:
            return ""
        }
    }
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func isValidPassword(_ password: String) -> Bool {
        // least one uppercase,
        // least one digit
        // least one lowercase
        // least one symbol
        //  min 8 characters total
        let password = password.trimmingCharacters(in: CharacterSet.whitespaces)
        let passwordRegx = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&<>*~:`-]).{8,}$"
        let passwordCheck = NSPredicate(format: "SELF MATCHES %@",passwordRegx)
        return passwordCheck.evaluate(with: password)

    }

}

extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        if textField == emailTF {
            firstNameTF.becomeFirstResponder()
        }
        else if textField == firstNameTF {
            lastNameTF.becomeFirstResponder()
        }
        else if textField == lastNameTF {
            passwordTF.becomeFirstResponder()
        }
        else if textField == passwordTF {
            confPasswordTF.becomeFirstResponder()
        }
        else if textField == confPasswordTF {
            didTapRegisterButton()
        }
        return true
    }
}

