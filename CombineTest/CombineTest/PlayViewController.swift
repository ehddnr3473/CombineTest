//
//  PlayViewController.swift
//  CombineTest
//
//  Created by 김동욱 on 2022/11/16.
//

import UIKit
import SnapKit
import Combine

final class PlayViewController: UIViewController {
    
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
        stackView.distribution = .fillProportionally
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
        
        return button
    }()
    
    private var textLabel: UILabel = {
        let label = UILabel()
        
        label.font = .boldSystemFont(ofSize: 30)
        label.text = "Label"
        
        return label
    }()
    
    private var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = LayoutConstants.standardOffset
        
        return stackView
    }()
    
    private lazy var firstButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("First", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(touchUpFirstButton(_:)), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var secondButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("Second", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(touchUpSecondButton(_:)), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpUI()
    }
    
    private func setUpUI() {
        view.backgroundColor = .cyan
        setUpHierachy()
        setUpLayout()
    }
    
    private func setUpHierachy() {
        [publishTextField, publishButton].forEach {
            publishStackView.addArrangedSubview($0)
        }
        
        [firstButton, secondButton].forEach {
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
            stackView.width.equalToSuperview().multipliedBy(0.5)
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
    
    @IBAction func touchUpPublishButton(_ sender: UIButton) {
        
    }
    
    @IBAction func touchUpFirstButton(_ sender: UIButton) {
        
    }
    
    @IBAction func touchUpSecondButton(_ sender: UIButton) {
        
    }
}

private struct LayoutConstants {
    static let standardOffset: CGFloat = 12
    static let largeOffset: CGFloat = 30
}