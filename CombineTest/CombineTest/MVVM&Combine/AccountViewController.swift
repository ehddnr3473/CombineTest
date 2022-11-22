//
//  ViewController.swift
//  CombineTest
//
//  Created by 김동욱 on 2022/11/16.
//

import UIKit
import SnapKit

final class AccountViewController: UIViewController {

    private var titleLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 30)
        label.text = "계정 정보"
        
        return label
    }()
    
    private var accountStackView: UIStackView = {
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
        label.font = .boldSystemFont(ofSize: 15)
        label.text = "ID: "
        
        return label
    }()
    
    private var idLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 15)
        
        return label
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
        label.font = .boldSystemFont(ofSize: 15)
        label.text = "PW: "
        
        return label
    }()
    
    private var passwordLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 15)
        
        return label
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
        label.font = .boldSystemFont(ofSize: 15)
        label.text = "이름: "
        
        return label
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 15)
        
        return label
    }()
    
    private lazy var modifyButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.backgroundColor = .cyan
        button.setTitle("정보 수정", for: .normal)
        button.addTarget(self, action: #selector(touchUpModifyButton(_:)), for: .touchUpInside)
        
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
        [idMarkingLabel, idLabel].forEach {
            idStackView.addArrangedSubview($0)
        }
        
        [passwordMarkingLabel, passwordLabel].forEach {
            passwordStackView.addArrangedSubview($0)
        }
        
        [nameMarkingLabel, nameLabel].forEach {
            nameStackView.addArrangedSubview($0)
        }
        
        [idStackView, passwordStackView, nameStackView].forEach {
            accountStackView.addArrangedSubview($0)
        }
        
        [titleLabel, accountStackView, modifyButton].forEach {
            view.addSubview($0)
        }
    }
    
    private func setUpLayout() {
        titleLabel.snp.makeConstraints { label in
            label.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(LayoutConstants.standardOffset)
            label.centerX.equalToSuperview()
        }
        
        accountStackView.snp.makeConstraints { stackView in
            stackView.centerX.equalToSuperview()
            stackView.top.equalTo(titleLabel.snp.bottom).offset(LayoutConstants.standardOffset)
            stackView.width.equalToSuperview().multipliedBy(LayoutConstants.accountStackViewMultiplier)
        }
        
        modifyButton.snp.makeConstraints { button in
            button.centerX.equalToSuperview()
            button.top.equalTo(accountStackView.snp.bottom).offset(LayoutConstants.standardOffset)
            button.width.equalToSuperview().multipliedBy(LayoutConstants.modifyButtonMultiplier)
        }
    }
    
    @IBAction func touchUpModifyButton(_ sender: UIButton) {
        let modifyViewController = ModifyViewController()
        navigationController?.pushViewController(modifyViewController, animated: true)
    }
}

private struct LayoutConstants {
    static let standardOffset: CGFloat = 12
    static let accountStackViewMultiplier: CGFloat = 0.7
    static let modifyButtonMultiplier: CGFloat = 0.5
}
