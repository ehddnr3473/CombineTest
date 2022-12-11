//
//  MyTestViewController.swift
//  CombineTest
//
//  Created by 김동욱 on 2022/12/11.
//

import UIKit

final class MyTestViewController: UIViewController {

    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Log In"
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private let username: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Username"
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.backgroundColor = .secondarySystemBackground
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.label.cgColor
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        textField.leftViewMode = .always
        return textField
    }()
    
    private let password: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isSecureTextEntry = true
        textField.placeholder = "Password"
        textField.backgroundColor = .secondarySystemBackground
        textField.layer.cornerRadius = 8
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.label.cgColor
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        textField.leftViewMode = .always
        return textField
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Continue", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        button.layer.cornerRadius = 8
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [label, username, password, button].forEach {
            view.addSubview($0)
        }
        addConstraints()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            label.widthAnchor.constraint(equalToConstant: 200),
            
            username.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            username.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            username.widthAnchor.constraint(equalToConstant: 250),
            username.heightAnchor.constraint(equalToConstant: 50),
            
            password.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            password.topAnchor.constraint(equalTo: username.bottomAnchor, constant: 10),
            password.widthAnchor.constraint(equalToConstant: 250),
            password.heightAnchor.constraint(equalToConstant: 50),
            
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 30),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func didTapButton() {
        guard let username = username.text, let password = password.text, username == "yeolmok", password == "password" else {
            let alert = UIAlertController(title: "Invalid Login", message: "Your login credentials were incorrect. Try again.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
            present(alert, animated: true)
            
            return
        }
        let nextViewController = AccountVC()
        nextViewController.modalPresentationStyle = .fullScreen
        present(nextViewController, animated: true)
    }
}


/// Account ViewController
final class AccountVC: UIViewController {
    
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Welcome, Yeolmok!"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 32, weight: .bold)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGreen
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.widthAnchor.constraint(equalToConstant: 300),
            label.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
