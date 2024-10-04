//
//  ViewController.swift
//  HeroTask
//
//  Created by Fırat Güler on 2.10.2024.
//

import UIKit
import Hero
import SnapKit

class ViewController: UIViewController {

    private let titleLabel = UILabel()
    private let nextButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        
        self.hero.isEnabled = true
        
        view.backgroundColor = .systemBackground
        
        // Title Label
        titleLabel.text = "Welcome to the maze. If you succeed, you are ready for the real world"
        titleLabel.numberOfLines = 2
        
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(52)
            make.leading.equalToSuperview().offset(32)
            make.trailing.equalToSuperview().offset(-32)
            
            make.height.equalTo(52)
        }
        
        // Next Button
        nextButton.setTitle("Next", for: .normal)
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.backgroundColor = .red
        nextButton.layer.cornerRadius = 8
        
        view.addSubview(nextButton)
        nextButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(80)
            make.centerX.equalToSuperview()
            
            make.width.equalTo(120)
            make.height.equalTo(52)
        }
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        
    }
    
    // MARK: - Selector

    @objc
    private func nextButtonTapped() {
        
        let firstPartVC = FirstPartVC()
        firstPartVC.hero.modalAnimationType = .zoom
        self.hero.replaceViewController(with: firstPartVC)

    }
}



