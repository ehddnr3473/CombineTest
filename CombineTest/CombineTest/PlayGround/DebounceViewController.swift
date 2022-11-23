//
//  DebounceViewController.swift
//  CombineTest
//
//  Created by 김동욱 on 2022/11/23.
//

import UIKit
import SnapKit
import Combine

class DebounceViewController: UIViewController {

    // MARK: - Properties
    private var practice = Practice()
    private var subscriptions = [AnyCancellable]()
    
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController()
        
        searchController.searchBar.tintColor = .black
        
        return searchController
    }()
    
    private var textLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 30)
        label.textColor = .red
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
//        configure()
        withoutExtension()
    }
    
    private func setUpUI() {
        view.backgroundColor = .white
        navigationItem.searchController = searchController
        searchController.isActive = true
        
        setUpHierachy()
        setUpLayout()
    }
    
    private func setUpHierachy() {
        [textLabel].forEach {
            view.addSubview($0)
        }
    }
    
    private func setUpLayout() {
        textLabel.snp.makeConstraints { label in
            label.centerX.equalToSuperview()
            label.centerY.equalToSuperview()
        }
    }
    
    private func configure() {
        searchController.searchBar.searchTextField.textFieldPublisher
            .receive(on: RunLoop.main)
//            .debounce(for: .milliseconds(1000), scheduler: RunLoop.main)
            .sink { [weak self] value in
                self?.textLabel.text = value
            }
            .store(in: &subscriptions)
    }
    
    private func withoutExtension() {
        NotificationCenter.default.publisher(for: UISearchTextField.textDidChangeNotification, object: searchController.searchBar.searchTextField)
            .compactMap { $0.object as? UISearchTextField }
            .map { $0.text ?? "" }
            .filter { $0.count > 0 }
            .debounce(for: .milliseconds(1000), scheduler: RunLoop.main)
            .receive(on: RunLoop.main)
            .sink { [weak self] value in
                self?.textLabel.text = value
            }
            .store(in: &subscriptions)
    }
}
