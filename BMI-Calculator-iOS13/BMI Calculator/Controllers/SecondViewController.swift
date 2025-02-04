//
//  SecondViewController.swift
//  BMI Calculator


import UIKit

class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
    }
    
    private lazy var backImage: UIImageView = {
        let backImage = UIImageView()
        backImage.image = UIImage(named: "result_background")
        backImage.translatesAutoresizingMaskIntoConstraints = false
        return backImage
    }()
    
    private lazy var mainLabel: UILabel = {
        let mainLabel = UILabel()
        mainLabel.text = "YOUR RESULT:"
        mainLabel.textColor = .systemIndigo
        mainLabel.font = UIFont(name: "Helvetica-Bold", size: 40)
        mainLabel.numberOfLines = 0
        mainLabel.textAlignment = .center
        mainLabel.backgroundColor = .clear
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        return mainLabel
    }()
    
    lazy var calculateLabel: UILabel = {
        let calculateLabel = UILabel()
        calculateLabel.textColor = .white
        calculateLabel.font = UIFont(name: "Helvetica-Bold", size: 110)
        calculateLabel.numberOfLines = 0
        calculateLabel.textAlignment = .center
        calculateLabel.backgroundColor = .clear
        calculateLabel.translatesAutoresizingMaskIntoConstraints = false
        return calculateLabel
    }()
    
    lazy var adviceLabel: UILabel = {
        let adviceLabel = UILabel()
        adviceLabel.textColor = .white
        adviceLabel.font = UIFont(name: "Helvetica-Light", size: 15)
        adviceLabel.numberOfLines = 0
        adviceLabel.textAlignment = .center
        adviceLabel.backgroundColor = .clear
        adviceLabel.translatesAutoresizingMaskIntoConstraints = false
        return adviceLabel
    }()
    
    private lazy var recalculateButton: UIButton = {
        let recalculateButton  = UIButton()
        recalculateButton.setTitle("RECALCULATE", for: .normal)
        recalculateButton.setTitleColor(.white, for: .normal)
        recalculateButton.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 20)
        recalculateButton.backgroundColor = .systemIndigo
        recalculateButton.layer.cornerRadius = 20
        recalculateButton.addTarget(self, action: #selector(recalculateButtonPushed), for: .touchUpInside)
        recalculateButton.translatesAutoresizingMaskIntoConstraints = false
        return recalculateButton
    }()
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(backImage)
        view.addSubview(mainLabel)
        view.addSubview(calculateLabel)
        view.addSubview(recalculateButton)
        view.addSubview(adviceLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backImage.topAnchor.constraint(equalTo: view.topAnchor),
            backImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 210),
            mainLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            mainLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            calculateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            calculateLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 260),
            calculateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            calculateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            recalculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            recalculateButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -275),
            recalculateButton.heightAnchor.constraint(equalToConstant: 50),
            recalculateButton.widthAnchor.constraint(equalToConstant: 180),
            
            adviceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            adviceLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 380),
            adviceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            adviceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
    @objc private func recalculateButtonPushed() {
        self.dismiss(animated: true)
    }
    
}
