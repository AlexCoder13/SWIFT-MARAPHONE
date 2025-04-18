//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var background: UIImageView = {
        let background = UIImageView()
        background.image = UIImage(named: "GreenBackground")
        background.translatesAutoresizingMaskIntoConstraints = false
        return background
    }()
    
    private lazy var diceLogo: UIImageView = {
        let diceLogo = UIImageView()
        diceLogo.image = UIImage(named: "DiceeLogo")
        diceLogo.translatesAutoresizingMaskIntoConstraints = false
        return diceLogo
    }()
    
    private lazy var rollTheDiceButton: UIButton = {
        let rollTheDiceButton = UIButton()
        rollTheDiceButton.setTitle("Roll the Dice", for: .normal)
        rollTheDiceButton.setTitleColor(.white, for: .normal)
        rollTheDiceButton.titleLabel?.font = .systemFont(ofSize: 45)
        rollTheDiceButton.contentHorizontalAlignment = .center
        rollTheDiceButton.backgroundColor = .clear
        rollTheDiceButton.layer.cornerRadius = 35
        rollTheDiceButton.clipsToBounds = true
        rollTheDiceButton.addTarget(self, action: #selector(pushButton), for: .touchUpInside)
        rollTheDiceButton.translatesAutoresizingMaskIntoConstraints = false
        return rollTheDiceButton
    }()
    
    private lazy var leftDiceOne: UIImageView = {
        let leftDiceOne = UIImageView()
        leftDiceOne.image = UIImage(named: "DiceOne")
        leftDiceOne.translatesAutoresizingMaskIntoConstraints = false
        return leftDiceOne
    }()
    
    private lazy var rightDiceOne: UIImageView = {
        let rightDiceOne = UIImageView()
        rightDiceOne.image = UIImage(named: "DiceTwo")
        rightDiceOne.translatesAutoresizingMaskIntoConstraints = false
        return rightDiceOne
    }()
    
    private lazy var resultLabel: UILabel = {
        let resultLabel = UILabel()
        resultLabel.text = "0"
        resultLabel.font = .boldSystemFont(ofSize: 100)
        resultLabel.textColor = .white
        resultLabel.textAlignment = .center
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        return resultLabel
    }()
    
//    private lazy var stackViewLogo: UIStackView = {
//        let stackViewLogo = UIStackView()
//        stackViewLogo.axis  = NSLayoutConstraint.Axis.vertical
//        stackViewLogo.distribution  = UIStackView.Distribution.fillEqually
//        stackViewLogo.alignment = UIStackView.Alignment.center
//        stackViewLogo.spacing = 0.0
//        stackViewLogo.addArrangedSubview(diceLogo)
//        stackViewLogo.translatesAutoresizingMaskIntoConstraints = false
//        return stackViewLogo
//    }()
//    
//    private lazy var stackViewDices: UIStackView = {
//        let stackViewDices = UIStackView()
//        stackViewDices.axis  = NSLayoutConstraint.Axis.vertical
//        stackViewDices.distribution  = UIStackView.Distribution.fillEqually
//        stackViewDices.alignment = UIStackView.Alignment.center
//        stackViewDices.spacing = 0.0
//        stackViewDices.addArrangedSubview(rollTheDiceButton)
//        stackViewDices.translatesAutoresizingMaskIntoConstraints = false
//        return stackViewDices
//    }()
//    
//    private lazy var stackView: UIStackView = {
//        let stackView   = UIStackView()
//        stackView.axis  = NSLayoutConstraint.Axis.vertical
//        stackView.distribution  = UIStackView.Distribution.fillEqually
//        stackView.alignment = UIStackView.Alignment.center
//        stackView.spacing = 0.0
//        stackView.addArrangedSubview(diceLogo)
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        return stackView
//    }()
//    
//    private lazy var stackView: UIStackView = {
//        let stackView   = UIStackView()
//        stackView.axis  = NSLayoutConstraint.Axis.vertical
//        stackView.distribution  = UIStackView.Distribution.fillEqually
//        stackView.alignment = UIStackView.Alignment.center
//        stackView.spacing = 0.0
//        stackView.addArrangedSubview(diceLogo)
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        return stackView
//    }()
    
    override func viewDidLoad() {
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        view.addSubview(background)
        
        view.addSubview(diceLogo)
        view.addSubview(rollTheDiceButton)
        
        view.addSubview(leftDiceOne)
        view.addSubview(rightDiceOne)
        
        view.addSubview(resultLabel)
        
//        view.addSubview(stackViewLogo)
//        view.addSubview(logoView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: view.topAnchor),
            background.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            background.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            diceLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            diceLogo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 55),
            diceLogo.widthAnchor.constraint(equalToConstant: 250),
            diceLogo.heightAnchor.constraint(equalToConstant: 160),
            
            leftDiceOne.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 300),
            leftDiceOne.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            leftDiceOne.widthAnchor.constraint(equalToConstant: 150),
            leftDiceOne.heightAnchor.constraint(equalToConstant: 150),
            
            rightDiceOne.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 300),
            rightDiceOne.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            rightDiceOne.widthAnchor.constraint(equalToConstant: 150),
            rightDiceOne.heightAnchor.constraint(equalToConstant: 150),
            
            rollTheDiceButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rollTheDiceButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90),
            rollTheDiceButton.widthAnchor.constraint(equalToConstant: 300),
            rollTheDiceButton.heightAnchor.constraint(equalToConstant: 80),
            
            resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resultLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -180),
            resultLabel.widthAnchor.constraint(equalToConstant: 150),
            resultLabel.heightAnchor.constraint(equalToConstant: 150),
            
//            stackViewLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            stackViewLogo.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
//            
//            stackViewDices.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            stackViewDices.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 0)
        ])
    }
    
    @objc private func pushButton() {
        let dices = [UIImage(named: "DiceOne"), UIImage(named: "DiceTwo"), UIImage(named: "DiceThree"),
                     UIImage(named: "DiceFour"), UIImage(named: "DiceFive"), UIImage(named: "DiceSix")]
        
        leftDiceOne.image = dices[.random(in: 0...5)]
        rightDiceOne.image = dices[.random(in: 0...5)]
        
        var leftValue: Int = 0
        var rightValue: Int = 0
        
        switch leftDiceOne.image {
        case dices[0]:
            leftValue = 1
        case dices[1]:
            leftValue = 2
        case dices[2]:
            leftValue = 3
        case dices[3]:
            leftValue = 4
        case dices[4]:
            leftValue = 5
        case dices[5]:
            leftValue = 6
        default:
            print("errora")
        }
        
        switch rightDiceOne.image {
        case dices[0]:
            rightValue = 1
        case dices[1]:
            rightValue = 2
        case dices[2]:
            rightValue = 3
        case dices[3]:
            rightValue = 4
        case dices[4]:
            rightValue = 5
        case dices[5]:
            rightValue = 6
        default:
            print("errora")
        }
        
        let resultValue = leftValue + rightValue
        resultLabel.text = "\(resultValue)"
    }
}

