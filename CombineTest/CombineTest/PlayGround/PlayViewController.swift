//
//  PlayViewController.swift
//  CombineTest
//
//  Created by 김동욱 on 2022/11/16.
//

import UIKit
import SnapKit
import Combine

/// Combine 프레임워크를 이용하여 다양한 코드를 실습해보는 Playground ViewController
final class PlayViewController: UIViewController {
    
    // MARK: - Properties
    private var practice = Practice()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 30)
        label.textColor = .white
        label.text = "Combine Practice"
        
        return label
    }()
    
    private var publishStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = LayoutConstants.standardOffset
        
        return stackView
    }()
    
    private var publishTextField: UITextField = {
        let textField = UITextField()
        
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.black.cgColor
        textField.placeholder = "바꿀 ID를 입력하세요."
        
        let paddingView = UIView(frame: .init(x: .zero, y: .zero, width: 5, height: textField.frame.height))
        
        textField.leftView = paddingView
        textField.leftViewMode = .always
        
        return textField
    }()
    
    private lazy var publishButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("Publish", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(touchUpPublishButton(_:)), for: .touchUpInside)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        
        // intrinsicSize에 패딩 값을 추가해줄것.
//        button.titleEdgeInsets = .init(top: .zero, left: 3, bottom: .zero, right: 3)
        
        return button
    }()
    
    private var textLabel: UILabel = {
        let label = UILabel()
        
        label.font = .boldSystemFont(ofSize: 20)
        label.text = "Press button to Publish."
        
        return label
    }()
    
    private var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = LayoutConstants.standardOffset
        
        return stackView
    }()
    
    private lazy var justButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("Just&Sink", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(touchUpJustSinkButton(_:)), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var assignButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("Assign", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(touchUpAssignButton(_:)), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var currentValueSubjectButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("CurrentValueSubject", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(touchUpCurrentValueSubjectButton(_:)), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var passthroughSubjectButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("PassthroughSubject", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(touchUpPassthroughSubjectButton(_:)), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var observableObjectButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("ObservableObject", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(touchUpObservableObjectButton(_:)), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var intArrayPublishButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("PublishAnIntArray", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(touchUpIntArrayPublishButton(_:)), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var notificationButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("Notification", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(touchUpNotificationButton(_:)), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var debounceButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Debounce Test", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(touchUpDebounceButton(_:)), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpUI()
//        print(publishButton.intrinsicContentSize)
//        print(publishButton.titleLabel?.intrinsicContentSize)
    }
    
    private func setUpUI() {
        view.backgroundColor = .cyan
        setUpHierachy()
        setUpLayout()
    }
}

// MARK: - Layout
extension PlayViewController {
    private func setUpHierachy() {
        [publishTextField, publishButton].forEach {
            publishStackView.addArrangedSubview($0)
        }
        
        [justButton, assignButton, currentValueSubjectButton, passthroughSubjectButton, observableObjectButton, intArrayPublishButton, notificationButton, debounceButton].forEach {
            buttonStackView.addArrangedSubview($0)
        }
        
        [titleLabel, publishStackView, textLabel, buttonStackView].forEach {
            view.addSubview($0)
        }
    }
    
    private func setUpLayout() {
        titleLabel.snp.makeConstraints { label in
            label.centerX.equalToSuperview()
            label.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
        
        publishStackView.snp.makeConstraints { stackView in
            stackView.centerX.equalToSuperview()
            stackView.top.equalTo(titleLabel.snp.bottom).offset(LayoutConstants.largeOffset)
            stackView.width.equalToSuperview().multipliedBy(LayoutConstants.publishStackViewMultiplier)
        }
        
        textLabel.snp.makeConstraints { label in
            label.top.equalTo(publishStackView.snp.bottom).offset(LayoutConstants.standardOffset)
            label.centerX.equalToSuperview()
        }
        
        buttonStackView.snp.makeConstraints { stackView in
            stackView.top.equalTo(textLabel.snp.bottom).offset(LayoutConstants.standardOffset)
            stackView.centerX.equalToSuperview()
            stackView.width.equalToSuperview().multipliedBy(LayoutConstants.buttonStackViewMultiplier)
        }
    }
}

// MARK: - Button Action
extension PlayViewController {
    @IBAction func touchUpPublishButton(_ sender: UIButton) {
        practice.changeId(to: publishTextField.text ?? "")
    }
    

    @IBAction func touchUpJustSinkButton(_ sender: UIButton) {
        practice.playSink { [weak self] value in
            self?.textLabel.text = value
        }
    }
    
    @IBAction func touchUpAssignButton(_ sender: UIButton) {
        practice.playAssign()
    }
    
    // CurrentValueSubject: initial value 필요
    @IBAction func touchUpCurrentValueSubjectButton(_ sender: UIButton) {
        practice.playCurrentValueSubject(initialValue: publishTextField.text ?? "")
    }
    
    @IBAction func touchUpPassthroughSubjectButton(_ sender: UIButton) {
        practice.playPassthroughSubject()
    }
    
    @IBAction func touchUpObservableObjectButton(_ sender: UIButton) {
        practice.playObservableObject()
    }
    
    @IBAction func touchUpIntArrayPublishButton(_ sender: UIButton) {
        practice.publishAnIntArary()
    }
    
    @IBAction func touchUpNotificationButton(_ sender: UIButton) {
        practice.publishWithNotificationCenter()
    }
    
    @IBAction func touchUpDebounceButton(_ sender: UIButton) {
        let debounceViewController = DebounceViewController()
        navigationController?.pushViewController(debounceViewController, animated: true)
    }
}

private struct LayoutConstants {
    static let standardOffset: CGFloat = 12
    static let largeOffset: CGFloat = 30
    static let publishStackViewMultiplier: CGFloat = 0.7
    static let buttonStackViewMultiplier: CGFloat = 0.4
}
