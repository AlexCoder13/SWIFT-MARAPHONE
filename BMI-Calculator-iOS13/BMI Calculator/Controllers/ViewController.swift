//
//  ViewController.swift
//  BMI Calculator


import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        setupView()
        setupConstraints()
    }
    
    private lazy var backImage: UIImageView = {
        let backImage = UIImageView()
        backImage.image = UIImage(named: "calculate_background")
        backImage.translatesAutoresizingMaskIntoConstraints = false
        return backImage
    }()
    
    private lazy var mainLabel: UILabel = {
        let mainLabel = UILabel()
        mainLabel.text = "CALCULATE YOUR BMI"
        mainLabel.textColor = .darkGray
        mainLabel.font = UIFont(name: "Helvetica-Bold", size: 40)
        mainLabel.numberOfLines = 0
        mainLabel.textAlignment = .left
        mainLabel.backgroundColor = .clear
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        return mainLabel
    }()
    
    private lazy var heightLabel: UILabel = {
        let heightLabel = UILabel()
        heightLabel.text = "Height"
        heightLabel.textColor = .darkGray
        heightLabel.font = UIFont(name: "HelveticaNeue-Light", size: 18)
        heightLabel.numberOfLines = 0
        heightLabel.textAlignment = .left
        heightLabel.backgroundColor = .clear
        heightLabel.translatesAutoresizingMaskIntoConstraints = false
        return heightLabel
    }()
    
    private lazy var weightLabel: UILabel = {
        let weightLabel = UILabel()
        weightLabel.text = "Weight"
        weightLabel.textColor = .darkGray
        weightLabel.font = UIFont(name: "HelveticaNeue-Light", size: 18)
        weightLabel.numberOfLines = 0
        weightLabel.textAlignment = .left
        weightLabel.backgroundColor = .clear
        weightLabel.translatesAutoresizingMaskIntoConstraints = false
        return weightLabel
    }()
    
    private lazy var countHeightLabel: UILabel = {
        let countHeightLabel = UILabel()
        countHeightLabel.text = "\(heightSlider.value) m"
        countHeightLabel.textColor = .darkGray
        countHeightLabel.font = UIFont(name: "HelveticaNeue-Light", size: 18)
        countHeightLabel.numberOfLines = 0
        countHeightLabel.textAlignment = .left
        countHeightLabel.backgroundColor = .clear
        countHeightLabel.translatesAutoresizingMaskIntoConstraints = false
        return countHeightLabel
    }()
    
    private lazy var countWeightLabel: UILabel = {
        let countWeightLabel = UILabel()
        countWeightLabel.text = "\(weightSlider.value) kg"
        countWeightLabel.textColor = .darkGray
        countWeightLabel.font = UIFont(name: "HelveticaNeue-Light", size: 18)
        countWeightLabel.numberOfLines = 0
        countWeightLabel.textAlignment = .left
        countWeightLabel.backgroundColor = .clear
        countWeightLabel.translatesAutoresizingMaskIntoConstraints = false
        return countWeightLabel
    }()
    
    private lazy var heightSlider: UISlider = {
        let heightSlider = UISlider()
        heightSlider.minimumValue = 0.00
        heightSlider.value = 1.50
        heightSlider.maximumValue = 3.00
        heightSlider.maximumTrackTintColor = .darkGray
        heightSlider.minimumTrackTintColor = .systemPurple
        heightSlider.addTarget(self, action: #selector(heightSliderChanged), for: .valueChanged)
        heightSlider.translatesAutoresizingMaskIntoConstraints = false
        return heightSlider
    }()
    
    private lazy var weightSlider: UISlider = {
        let weightSlider = UISlider()
        weightSlider.minimumValue = 0.0
        weightSlider.value = 100.0
        weightSlider.maximumValue = 200.0
        weightSlider.maximumTrackTintColor = .darkGray
        weightSlider.minimumTrackTintColor = .systemIndigo
        weightSlider.addTarget(self, action: #selector(weightSliderChanged), for: .valueChanged)
        weightSlider.translatesAutoresizingMaskIntoConstraints = false
        return weightSlider
    }()

    private func setupView() {
        view.addSubview(backImage)
        view.addSubview(mainLabel)
        view.addSubview(heightLabel)
        view.addSubview(weightLabel)
        view.addSubview(countHeightLabel)
        view.addSubview(countWeightLabel)
        view.addSubview(heightSlider)
        view.addSubview(weightSlider)
        
        print(heightSlider.value)
        print(weightSlider.value)
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
            
            heightSlider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            heightSlider.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200),
            heightSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            heightSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            weightSlider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weightSlider.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -125),
            weightSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            weightSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            heightLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -235),
            heightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
            heightLabel.heightAnchor.constraint(equalToConstant: 20),
            heightLabel.widthAnchor.constraint(equalToConstant: 70),
            
            weightLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -160),
            weightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
            weightLabel.heightAnchor.constraint(equalToConstant: 20),
            weightLabel.widthAnchor.constraint(equalToConstant: 70),
            
            countHeightLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -235),
            countHeightLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            countHeightLabel.heightAnchor.constraint(equalToConstant: 20),
            countHeightLabel.widthAnchor.constraint(equalToConstant: 70),
            
            countWeightLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -160),
            countWeightLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            countWeightLabel.heightAnchor.constraint(equalToConstant: 20),
            countWeightLabel.widthAnchor.constraint(equalToConstant: 70),
        ])
    }

    @objc private func heightSliderChanged() {
        let height = String(format: "%.2f", heightSlider.value)
        countHeightLabel.text = "\(height) m"
    }
    
    @objc private func weightSliderChanged() {
        let weight = String(format: "%.1f", weightSlider.value)
        countWeightLabel.text = "\(weight) kg"
    }
    
}

