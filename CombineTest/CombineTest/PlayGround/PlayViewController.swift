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
        
        [justButton, assignButton, currentValueSubjectButton].forEach {
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
            stackView.width.equalToSuperview().multipliedBy(0.7)
        }
        
        textLabel.snp.makeConstraints { label in
            label.top.equalTo(publishStackView.snp.bottom).offset(LayoutConstants.standardOffset)
            label.centerX.equalToSuperview()
        }
        
        buttonStackView.snp.makeConstraints { stackView in
            stackView.top.equalTo(textLabel.snp.bottom).offset(LayoutConstants.standardOffset)
            stackView.centerX.equalToSuperview()
            stackView.width.equalToSuperview().multipliedBy(0.4)
        }
    }
}

// MARK: - Button Action
extension PlayViewController {
    @IBAction func touchUpPublishButton(_ sender: UIButton) {
        
    }
    

    @IBAction func touchUpJustSinkButton(_ sender: UIButton) {
        practice.sink01 { [weak self] value in
            self?.textLabel.text = value
        }
    }
    
    @IBAction func touchUpAssignButton(_ sender: UIButton) {
        practice.assign01()
    }
    
    @IBAction func touchUpCurrentValueSubjectButton(_ sender: UIButton) {
        let text = publishTextField.text ?? ""
        practice.currentValueSubject01(initialValue: text)
    }
}

private struct LayoutConstants {
    static let standardOffset: CGFloat = 12
    static let largeOffset: CGFloat = 30
}
