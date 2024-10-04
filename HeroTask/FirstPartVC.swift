//
//  FirstPartVC.swift
//  HeroTask
//
//  Created by Fırat Güler on 4.10.2024.
//

import UIKit
import Hero

class FirstPartVC: UIViewController {
    
    private let arrowButtonView = ArrowsButtonView()
    private let messageLabel = UILabel()
    
    private let trueWay = ["up", "right", "right", "down", "left", "left"]
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hero.isEnabled = true
        
        setupUI()
        addAction()
    }
    
    private func setupUI() {
        
        view.backgroundColor = .systemMint
        
        // Block Back
        navigationItem.hidesBackButton = true
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        
        // Arrow Buttons
        view.addSubview(arrowButtonView)
        arrowButtonView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        // Message Label
        messageLabel.text = "You're trapped, try again!"
        messageLabel.isHidden = true
        
        view.addSubview(messageLabel)
        messageLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(52)
            make.centerX.equalToSuperview()
            
            make.height.equalTo(52)
        }
        
    }
    
    func addAction(){
        let trueVC = trueVC()
     
       
        arrowButtonView.didClickUp = {
            self.controlWay("up")
            
            trueVC.hero.modalAnimationType = .slide(direction: .up)
            self.present(trueVC, animated: true)
        }
        
        arrowButtonView.didClickRight = {
            self.controlWay("right")
            
            trueVC.hero.modalAnimationType = .zoomSlide(direction: .right)
            
            self.present(trueVC, animated: true)
        }
        
        arrowButtonView.didClickLeft = {
            self.controlWay("left")
            
            trueVC.hero.modalAnimationType = .zoomSlide(direction: .left)
            self.present(trueVC, animated: true)
        }
        
        arrowButtonView.didClickDown = {
            self.controlWay("down")
            
            trueVC.hero.modalAnimationType = .cover(direction: .down)
            self.present(trueVC, animated: true)
        }
    }
    
    private func wrongAnswerAction() {
      
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.messageLabel.isHidden = true
        }
    }
    
    private func controlWay(_ sender : String) {
        //["up", "right", "right", "down", "left", "left"]
  
        if counter < trueWay.count {
            if trueWay[counter] == sender {
                counter += 1
                
                if counter == trueWay.count {
                         makeAlert(message: "Congratulations, you did it!")
                         counter = 0
                     }
            }
           else {
                makeAlert(message: "You're trapped, try again!")
                counter = 0
            }
        }
        
    }
    
    private func makeAlert(message : String) {
        
        let alert = UIAlertController(title: "Alert",
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default))
        present(alert , animated: true)
    }
    
}


class trueVC : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hero.isEnabled = true
        view.backgroundColor = .green
        
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.dismiss(animated: true)
        }
    }
}


