//
//  ModifyViewController.swift
//  CombineTest
//
//  Created by 김동욱 on 2022/11/22.
//

import UIKit
import SnapKit

class ModifyViewController: UIViewController {

    private var titleLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 30)
        label.text = "정보 수정"
        
        return label
    }()
    
    private var modifyStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = LayoutConstants.standardOffset
        
        return stackView
    }()
    
    private var idStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = LayoutConstants.standardOffset
        
        return stackView
    }()
    
    private var idMarkingLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 25)
        label.text = "ID:   "
        
        return label
    }()
    
    private var idTextField: UITextField = {
        let textField = UITextField()
        
        textField.font = .boldSystemFont(ofSize: 25)
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.placeholder = "수정할 아이디"
        
        let paddingView = UIView(frame: .init(x: .zero, y: .zero, width: 5, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        
        textField.setContentHuggingPriority(.init(rawValue: 100), for: .horizontal)
        
        return textField
    }()
    
    private var passwordStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = LayoutConstants.standardOffset
        
        return stackView
    }()
    
    private var passwordMarkingLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 25)
        label.text = "PW: "
        
        return label
    }()
    
    private var passwordTextField: UITextField = {
        let textField = UITextField()
        
        textField.font = .boldSystemFont(ofSize: 25)
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.placeholder = "수정할 비밀번호"
        
        let paddingView = UIView(frame: .init(x: .zero, y: .zero, width: 5, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        
        return textField
    }()
    
    private var passwordConfirmStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = LayoutConstants.standardOffset
        
        return stackView
    }()
    
    private var passwordConfirmMarkingLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 25)
        label.text = "확인: "
        
        return label
    }()
    
    private var passwordConfirmTextField: UITextField = {
        let textField = UITextField()
        
        textField.font = .boldSystemFont(ofSize: 25)
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.placeholder = "비밀번호 확인"
        
        let paddingView = UIView(frame: .init(x: .zero, y: .zero, width: 5, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        
        return textField
    }()
    
    
    private var nameStackView: UIStackView = {
        let stackView = UIStackView()
       
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = LayoutConstants.standardOffset
        
        return stackView
    }()
    
    private var nameMarkingLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 25)
        label.text = "이름: "
        
        return label
    }()
    
    private var nameTextField: UITextField = {
        let textField = UITextField()
        
        textField.font = .boldSystemFont(ofSize: 25)
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.placeholder = "수정할 이름(별명)"
        
        let paddingView = UIView(frame: .init(x: .zero, y: .zero, width: 5, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        
        return textField
    }()
    
    private lazy var submitButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.backgroundColor = .cyan
        button.setTitle("수정", for: .normal)
        button.addTarget(self, action: #selector(touchUpSubmitButton(_:)), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
    }
    
    private func setUpUI() {
        view.backgroundColor = .white
        setUpHierachy()
        setUpLayout()
    }
    
    private func setUpHierachy() {
        [idMarkingLabel, idTextField].forEach {
            idStackView.addArrangedSubview($0)
        }
        
        [passwordMarkingLabel, passwordTextField].forEach {
            passwordStackView.addArrangedSubview($0)
        }
        
        [passwordConfirmMarkingLabel, passwordConfirmTextField].forEach {
            passwordConfirmStackView.addArrangedSubview($0)
        }
        
        [nameMarkingLabel, nameTextField].forEach {
            nameStackView.addArrangedSubview($0)
        }
        
        [idStackView, passwordStackView, passwordConfirmStackView, nameStackView].forEach {
            modifyStackView.addArrangedSubview($0)
        }
        
        [modifyStackView, submitButton].forEach {
            view.addSubview($0)
        }
    }
    
    private func setUpLayout() {
        modifyStackView.snp.makeConstraints { stackView in
            stackView.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            stackView.centerX.equalToSuperview()
            stackView.width.equalToSuperview().multipliedBy(LayoutConstants.modifyStackViewMultiplier)
        }
        
        submitButton.snp.makeConstraints { button in
            button.top.equalTo(modifyStackView.snp.bottom).offset(LayoutConstants.largeOffset)
            button.centerX.equalToSuperview()
            button.width.equalToSuperview().multipliedBy(LayoutConstants.submitButtonMultiplier)
        }
    }
    
    @IBAction func touchUpSubmitButton(_ sender: UIButton) {
        
    }
}

private struct LayoutConstants {
    static let standardOffset: CGFloat = 12
    static let largeOffset: CGFloat = 30
    static let modifyStackViewMultiplier: CGFloat = 0.9
    static let submitButtonMultiplier: CGFloat = 0.5
}
