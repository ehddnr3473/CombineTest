//
//  ModifyViewController.swift
//  CombineTest
//
//  Created by 김동욱 on 2022/11/22.
//

import UIKit
import SnapKit
import Combine

/// 계정 정보를 수정하는 ViewController
final class ModifyViewController: UIViewController {

    // MARK: - Properties
    var account: AccountInformation?
    private var modifyVerification = ModifyVerification()
    
    private var subscriptions = [AnyCancellable]()
    
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
    
    var idTextField: UITextField = {
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
    
    var passwordTextField: UITextField = {
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
    
    var nameTextField: UITextField = {
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
        
        button.setTitle("수정", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(touchUpSubmitButton(_:)), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        configure()
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
    
    private func configure() {
        guard let account = account else { return }
        
        idTextField.text = account.id
        passwordTextField.text = account.password
        nameTextField.text = account.name
        
        // View Model의 property에 값 할당.
        // 즉시 비밀번호와, 비밀번호 확인 text를 비교하기 위함.
        modifyVerification.password = account.password
        
        // textField에서 publish한 것을 View Model의 property에 할당(subscribe)
        passwordTextField.textPublisher
            // 결과가 UI를 업데이트하는 경우, receive(on:options:) 메서드를 호출하여 메인 스레드로 콜백 전달할 수 있음.
            .receive(on: RunLoop.main)
            .assign(to: \.password, on: modifyVerification)
            .store(in: &subscriptions)
        
        passwordConfirmTextField.textPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.passwordConfirm, on: modifyVerification)
            .store(in: &subscriptions)
        
        // View Model property에서 publish한 것을 UIButton의 property에 할당(subscribe)
        modifyVerification.isMatched
            .receive(on: RunLoop.main)
            .assign(to: \.isValid, on: submitButton)
            .store(in: &subscriptions)
    }
    
    // 계정 정보를 수정하고 pop
    @IBAction func touchUpSubmitButton(_ sender: UIButton) {
        account?.modify(id: idTextField.text ?? "", password: passwordTextField.text ?? "", name: nameTextField.text ?? "")
        navigationController?.popViewController(animated: true)
    }
}

private struct LayoutConstants {
    static let standardOffset: CGFloat = 12
    static let largeOffset: CGFloat = 30
    static let modifyStackViewMultiplier: CGFloat = 0.9
    static let submitButtonMultiplier: CGFloat = 0.5
}
