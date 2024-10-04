//
//  ArrowsButtonView.swift
//  HeroTask
//
//  Created by Fırat Güler on 4.10.2024.
//

import UIKit
import SnapKit

class ArrowsButtonView : UIView {
    
    var didClickLeft: (() -> ())?
    var didClickRight: (() -> ())?
    var didClickUp: (() -> ())?
    var didClickDown: (() -> ())?
    
    var upButton = UIButton()
    var downButton = UIButton()
    var leftButton = UIButton()
    var rightButton = UIButton()
    
    private var buttonWidthHeight = 50.0
    private var viewSize : CGSize {
        CGSize(width: buttonWidthHeight * 3 ,
               height: buttonWidthHeight * 3)
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        
        // View size
        self.snp.makeConstraints { make in
            make.size.equalTo(viewSize)
        }
        
        //Up Arrow Button
        buttonSetup(upButton, systemImageName: "arrowshape.up")
        
        addSubview(upButton)
        upButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            
            make.width.height.equalTo(buttonWidthHeight)
        }
        upButton.addTarget(self, action: #selector(didTapUp), for: .touchUpInside)
        
        //Left Arrow Button
        buttonSetup(leftButton, systemImageName: "arrowshape.left")
        
        addSubview(leftButton)
        leftButton.snp.makeConstraints { make in
            make.top.equalTo(upButton.snp.bottom)
            make.left.equalToSuperview()
            
            make.width.height.equalTo(buttonWidthHeight)
        }
        leftButton.addTarget(self, action: #selector(didTapLeft), for: .touchUpInside)
        
        //Down Arrow Button
        buttonSetup(downButton, systemImageName: "arrowshape.down")
        
        addSubview(downButton)
        downButton.snp.makeConstraints { make in
            make.top.equalTo(leftButton.snp.bottom)
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
            
            make.width.height.equalTo(buttonWidthHeight)
        }
        downButton.addTarget(self, action: #selector(didTapDown), for: .touchUpInside)
        
        //Rigth Arrow Button
        buttonSetup(rightButton, systemImageName: "arrowshape.right")
        
        addSubview(rightButton)
        rightButton.snp.makeConstraints { make in
            make.top.equalTo(upButton.snp.bottom)
            make.right.equalToSuperview()
            
            make.width.height.equalTo(buttonWidthHeight)
        }
        rightButton.addTarget(self, action: #selector(didTapRight), for: .touchUpInside)
    }
    
    private func buttonSetup(_ btn : UIButton , systemImageName : String){
        
        btn.setImage(UIImage(systemName: systemImageName), for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.tintColor = .white
        btn.backgroundColor = .black.withAlphaComponent(0.8)
        
        btn.layer.borderWidth = 1.0
        btn.layer.borderColor = UIColor.lightGray.cgColor
        
        btn.layer.cornerRadius = 8.0
    }
    
    @objc
    func didTapUp(){
        if let didClickUp{
            didClickUp()
        }
    }
    
    @objc
    func didTapLeft(){
        if let didClickLeft{
            didClickLeft()
        }
    }
    
    @objc
    func didTapRight(){
        if let didClickRight{
            didClickRight()
        }
    }
    
    @objc
    func didTapDown(){
        if let didClickDown{
            didClickDown()
        }
    }
    
}
