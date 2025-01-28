//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var labelC: UILabel = {
        let labelC = UILabel()
        labelC.text = "C"
        labelC.textColor = .white
        labelC.font = .boldSystemFont(ofSize: 70)
        labelC.textAlignment = .center
        labelC.backgroundColor = .clear
        labelC.translatesAutoresizingMaskIntoConstraints = false
        return labelC
    }()
    
    private lazy var buttonC: UIButton = {
        let buttonC = UIButton()
        buttonC.setTitle("C", for: .normal)
        buttonC.setTitleColor(.white, for: .normal)
        buttonC.titleLabel?.font = .boldSystemFont(ofSize: 50)
        buttonC.contentHorizontalAlignment = .center
        buttonC.contentVerticalAlignment = .center
        buttonC.layer.cornerRadius = 20
        buttonC.addTarget(self, action: #selector(pushButtonC), for: .touchUpInside)
        buttonC.translatesAutoresizingMaskIntoConstraints = false
        buttonC.backgroundColor = .systemRed
        return buttonC
    }()
    
    private lazy var labelD: UILabel = {
        let labelD = UILabel()
        labelD.text = "D"
        labelD.textColor = .white
        labelD.font = .boldSystemFont(ofSize: 50)
        labelD.textAlignment = .center
        labelD.backgroundColor = .clear
        labelD.translatesAutoresizingMaskIntoConstraints = false
        return labelD
    }()
    
    private lazy var buttonD: UIButton = {
        let buttonD = UIButton()
        buttonD.setTitle("D", for: .normal)
        buttonD.setTitleColor(.white, for: .normal)
        buttonD.titleLabel?.font = .boldSystemFont(ofSize: 50)
        buttonD.contentHorizontalAlignment = .center
        buttonD.contentVerticalAlignment = .center
        buttonD.layer.cornerRadius = 20
        //        buttonD.addTarget(self, action: #selector(pushButtonD), for: .touchUpInside)
        buttonD.translatesAutoresizingMaskIntoConstraints = false
        buttonD.backgroundColor = .orange
        return buttonD
    }()
    
    private lazy var labelE: UILabel = {
        let labelE = UILabel()
        labelE.text = "E"
        labelE.textColor = .white
        labelE.font = .boldSystemFont(ofSize: 50)
        labelE.textAlignment = .center
        labelE.backgroundColor = .clear
        labelE.translatesAutoresizingMaskIntoConstraints = false
        return labelE
    }()
    
    private lazy var buttonE: UIButton = {
        let buttonE = UIButton()
        buttonE.setTitle("E", for: .normal)
        buttonE.setTitleColor(.white, for: .normal)
        buttonE.titleLabel?.font = .boldSystemFont(ofSize: 50)
        buttonE.contentHorizontalAlignment = .center
        buttonE.contentVerticalAlignment = .center
        buttonE.layer.cornerRadius = 20
        //        buttonE.addTarget(self, action: #selector(pushButtonE), for: .touchUpInside)
        buttonE.translatesAutoresizingMaskIntoConstraints = false
        buttonE.backgroundColor = .systemYellow
        return buttonE
    }()
    
    private lazy var labelF: UILabel = {
        let labelF = UILabel()
        labelF.text = "F"
        labelF.textColor = .white
        labelF.font = .boldSystemFont(ofSize: 70)
        labelF.textAlignment = .center
        labelF.backgroundColor = .clear
        labelF.translatesAutoresizingMaskIntoConstraints = false
        return labelF
    }()
    
    private lazy var buttonF: UIButton = {
        let buttonF = UIButton()
        buttonF.setTitle("F", for: .normal)
        buttonF.setTitleColor(.white, for: .normal)
        buttonF.titleLabel?.font = .boldSystemFont(ofSize: 50)
        buttonF.contentHorizontalAlignment = .center
        buttonF.contentVerticalAlignment = .center
        buttonF.layer.cornerRadius = 20
        //        buttonF.addTarget(self, action: #selector(pushButtonF), for: .touchUpInside)
        buttonF.translatesAutoresizingMaskIntoConstraints = false
        buttonF.backgroundColor = .systemGreen
        return buttonF
    }()
    
    private lazy var labelG: UILabel = {
        let labelG = UILabel()
        labelG.text = "G"
        labelG.textColor = .white
        labelG.font = .boldSystemFont(ofSize: 50)
        labelG.textAlignment = .center
        labelG.backgroundColor = .clear
        labelG.translatesAutoresizingMaskIntoConstraints = false
        return labelG
    }()
    
    private lazy var buttonG: UIButton = {
        let buttonG = UIButton()
        buttonG.setTitle("G", for: .normal)
        buttonG.setTitleColor(.white, for: .normal)
        buttonG.titleLabel?.font = .boldSystemFont(ofSize: 50)
        buttonG.contentHorizontalAlignment = .center
        buttonG.contentVerticalAlignment = .center
        buttonG.layer.cornerRadius = 20
        //        buttonG.addTarget(self, action: #selector(pushButtonG), for: .touchUpInside)
        buttonG.translatesAutoresizingMaskIntoConstraints = false
        buttonG.backgroundColor = .systemCyan
        return buttonG
    }()
    
    private lazy var labelA: UILabel = {
        let labelA = UILabel()
        labelA.text = "A"
        labelA.textColor = .white
        labelA.font = .boldSystemFont(ofSize: 50)
        labelA.textAlignment = .center
        labelA.backgroundColor = .clear
        labelA.translatesAutoresizingMaskIntoConstraints = false
        return labelA
    }()
    
    private lazy var buttonA: UIButton = {
        let buttonA = UIButton()
        buttonA.setTitle("A", for: .normal)
        buttonA.setTitleColor(.white, for: .normal)
        buttonA.titleLabel?.font = .boldSystemFont(ofSize: 50)
        buttonA.contentHorizontalAlignment = .center
        buttonA.contentVerticalAlignment = .center
        buttonA.layer.cornerRadius = 20
        //        buttonA.addTarget(self, action: #selector(pushButtonA), for: .touchUpInside)
        buttonA.translatesAutoresizingMaskIntoConstraints = false
        buttonA.backgroundColor = .systemBlue
        return buttonA
    }()
    
    private lazy var labelB: UILabel = {
        let labelB = UILabel()
        labelB.text = "B"
        labelB.textColor = .white
        labelB.font = .boldSystemFont(ofSize: 70)
        labelB.textAlignment = .center
        labelB.backgroundColor = .clear
        labelB.translatesAutoresizingMaskIntoConstraints = false
        return labelB
    }()
    
    private lazy var buttonB: UIButton = {
        let buttonB = UIButton()
        buttonB.setTitle("B", for: .normal)
        buttonB.setTitleColor(.white, for: .normal)
        buttonB.titleLabel?.font = .boldSystemFont(ofSize: 50)
        buttonB.contentHorizontalAlignment = .center
        buttonB.contentVerticalAlignment = .center
        buttonB.layer.cornerRadius = 20
        //        buttonB.addTarget(self, action: #selector(pushButtonB), for: .touchUpInside)
        buttonB.translatesAutoresizingMaskIntoConstraints = false
        buttonB.backgroundColor = .systemPurple
        return buttonB
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        view.backgroundColor = .placeholderText
        
        view.addSubview(buttonC)
        view.addSubview(labelC)
        
        view.addSubview(buttonD)
        view.addSubview(labelD)
        
        view.addSubview(buttonE)
        view.addSubview(labelE)
        
        view.addSubview(buttonF)
        view.addSubview(labelF)
        
        view.addSubview(buttonG)
        view.addSubview(labelG)
        
        view.addSubview(buttonA)
        view.addSubview(labelA)
        
        view.addSubview(buttonB)
        view.addSubview(labelB)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            buttonC.heightAnchor.constraint(equalToConstant: 80),
            buttonC.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            buttonC.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            buttonC.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonC.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            
            labelC.heightAnchor.constraint(equalToConstant: 80),
            labelC.widthAnchor.constraint(equalToConstant: 60),
            labelC.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            labelC.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            buttonD.heightAnchor.constraint(equalToConstant: 80),
            buttonD.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            buttonD.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            buttonD.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonD.bottomAnchor.constraint(equalTo: buttonC.topAnchor, constant: -16),
            
            labelD.heightAnchor.constraint(equalToConstant: 80),
            labelD.widthAnchor.constraint(equalToConstant: 60),
            labelD.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 17),
            labelD.leadingAnchor.constraint(equalTo: labelC.trailingAnchor, constant: 0),
            
            buttonE.heightAnchor.constraint(equalToConstant: 80),
            buttonE.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            buttonE.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            buttonE.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonE.bottomAnchor.constraint(equalTo: buttonD.topAnchor, constant: -16),
            
            labelE.heightAnchor.constraint(equalToConstant: 80),
            labelE.widthAnchor.constraint(equalToConstant: 60),
            labelE.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 17),
            labelE.leadingAnchor.constraint(equalTo: labelC.trailingAnchor, constant: 48),
            
            buttonF.heightAnchor.constraint(equalToConstant: 80),
            buttonF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            buttonF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            buttonF.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonF.bottomAnchor.constraint(equalTo: buttonE.topAnchor, constant: -16),
            
            labelF.heightAnchor.constraint(equalToConstant: 80),
            labelF.widthAnchor.constraint(equalToConstant: 60),
            labelF.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            labelF.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            buttonG.heightAnchor.constraint(equalToConstant: 80),
            buttonG.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 48),
            buttonG.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -48),
            buttonG.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonG.bottomAnchor.constraint(equalTo: buttonF.topAnchor, constant: -16),
            
            labelG.heightAnchor.constraint(equalToConstant: 80),
            labelG.widthAnchor.constraint(equalToConstant: 60),
            labelG.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 17),
            labelG.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 225),
            
            buttonA.heightAnchor.constraint(equalToConstant: 80),
            buttonA.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 56),
            buttonA.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -56),
            buttonA.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonA.bottomAnchor.constraint(equalTo: buttonG.topAnchor, constant: -16),
            
            labelA.heightAnchor.constraint(equalToConstant: 80),
            labelA.widthAnchor.constraint(equalToConstant: 60),
            labelA.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 17),
            labelA.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 275),
            
            buttonB.heightAnchor.constraint(equalToConstant: 80),
            buttonB.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64),
            buttonB.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64),
            buttonB.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonB.bottomAnchor.constraint(equalTo: buttonA.topAnchor, constant: -16),
            
            labelB.heightAnchor.constraint(equalToConstant: 80),
            labelB.widthAnchor.constraint(equalToConstant: 60),
            labelB.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            labelB.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
    }
    
    
    @objc private func pushButtonC() {
//        UIView.animate(withDuration: 0.3) {
//            self.labelC.textColor = self.buttonC.backgroundColor
        
        UIView.animate(withDuration: 1, delay: 1, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: .curveEaseInOut) {
            self.labelC.textColor = self.buttonC.backgroundColor
            
        }
    }
}
                        
                        
