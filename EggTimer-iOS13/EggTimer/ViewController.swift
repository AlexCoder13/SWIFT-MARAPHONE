//
//  ViewController.swift
//  EggTimer


import UIKit

class ViewController: UIViewController {
    
    private var secondsForSoftCook = 5
    private var secondsForMediumCook = 10
    private var secondsForHardCook = 15
    private var currentSeconds = 0
    
    private var timer = Timer()
    
    private lazy var questionLabel: UILabel = {
        let questionLabel = UILabel()
        questionLabel.text = "Готовим яички -_-"
        questionLabel.textColor = .systemYellow
        questionLabel.font = .boldSystemFont(ofSize: 35)
        questionLabel.textAlignment = .center
        questionLabel.numberOfLines = 0
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        return questionLabel
    }()
    
    private lazy var softImageView: UIImageView = {
        let softImageView = UIImageView()
        softImageView.image = UIImage(named: "soft_egg")
        softImageView.translatesAutoresizingMaskIntoConstraints = false
        return softImageView
    }()
    
    private lazy var mediumImageView: UIImageView = {
        let mediumImageView = UIImageView()
        mediumImageView.image = UIImage(named: "medium_egg")
        mediumImageView.translatesAutoresizingMaskIntoConstraints = false
        return mediumImageView
    }()
    
    private lazy var hardImageView: UIImageView = {
        let hardImageView = UIImageView()
        hardImageView.image = UIImage(named: "hard_egg")
        hardImageView.translatesAutoresizingMaskIntoConstraints = false
        return hardImageView
    }()
    
    private lazy var softButton: UIButton = {
        let softButton = UIButton()
        softButton.setTitle("soft", for: .normal)
        softButton.setTitleColor(.white, for: .normal)
        softButton.titleLabel?.font = .boldSystemFont(ofSize: 15)
        softButton.backgroundColor = .clear
        softButton.layer.cornerRadius = 60
        softButton.addTarget(self, action: #selector(pushSoftButton), for: .touchUpInside)
        softButton.translatesAutoresizingMaskIntoConstraints = false
        return softButton
    }()
    
    private lazy var mediumButton: UIButton = {
        let mediumButton = UIButton()
        mediumButton.setTitle("medium", for: .normal)
        mediumButton.setTitleColor(.white, for: .normal)
        mediumButton.titleLabel?.font = .boldSystemFont(ofSize: 15)
        mediumButton.backgroundColor = .clear
        mediumButton.layer.cornerRadius = 60
        mediumButton.addTarget(self, action: #selector(pushMediumButton), for: .touchUpInside)
        mediumButton.translatesAutoresizingMaskIntoConstraints = false
        return mediumButton
    }()
    
    private lazy var hardButton: UIButton = {
        let hardButton = UIButton()
        hardButton.setTitle("hard", for: .normal)
        hardButton.setTitleColor(.white, for: .normal)
        hardButton.titleLabel?.font = .boldSystemFont(ofSize: 15)
        hardButton.backgroundColor = .clear
        hardButton.layer.cornerRadius = 60
        hardButton.addTarget(self, action: #selector(pushHardButton), for: .touchUpInside)
        hardButton.translatesAutoresizingMaskIntoConstraints = false
        return hardButton
    }()
    
    private lazy var progressBar: UIProgressView = {
        let progressBar = UIProgressView()
        progressBar.progressViewStyle = .bar
        progressBar.progressTintColor = .systemYellow
        progressBar.trackTintColor = .systemGray
        progressBar.layer.cornerRadius = 7
        progressBar.clipsToBounds = true
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        return progressBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }

    private func setupView() {
        view.backgroundColor = .systemIndigo
        
        view.addSubview(questionLabel)
        
        view.addSubview(softButton)
        view.addSubview(mediumButton)
        view.addSubview(hardButton)
        
        view.addSubview(softImageView)
        view.addSubview(mediumImageView)
        view.addSubview(hardImageView)
        
        view.addSubview(progressBar)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            questionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            questionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            questionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            softImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            softImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            softImageView.heightAnchor.constraint(equalToConstant: 160),
            softImageView.widthAnchor.constraint(equalToConstant: 120),
            
            mediumImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            mediumImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mediumImageView.heightAnchor.constraint(equalToConstant: 160),
            mediumImageView.widthAnchor.constraint(equalToConstant: 120),
            
            hardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            hardImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            hardImageView.heightAnchor.constraint(equalToConstant: 160),
            hardImageView.widthAnchor.constraint(equalToConstant: 120),
            
            softButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            softButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            softButton.heightAnchor.constraint(equalToConstant: 160),
            softButton.widthAnchor.constraint(equalToConstant: 120),
            
            mediumButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            mediumButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mediumButton.heightAnchor.constraint(equalToConstant: 160),
            mediumButton.widthAnchor.constraint(equalToConstant: 120),
            
            hardButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            hardButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            hardButton.heightAnchor.constraint(equalToConstant: 160),
            hardButton.widthAnchor.constraint(equalToConstant: 120),
            
            progressBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            progressBar.centerYAnchor.constraint(equalTo: view.bottomAnchor, constant: -320),
            progressBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            progressBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            progressBar.heightAnchor.constraint(equalToConstant: 7),
        ])
    }
    
    @objc private func pushSoftButton() {
        timer.invalidate()
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateSoftTimer), userInfo: nil, repeats: true)
        progressBar.progress = 0
        currentSeconds = 0
        self.questionLabel.text = "Готовим яички -_-"
    }
    
    @objc private func pushMediumButton() {
        timer.invalidate()
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateMediumTimer), userInfo: nil, repeats: true)
        progressBar.progress = 0
        currentSeconds = 0
        self.questionLabel.text = "Готовим яички -_-"
    }
    
    @objc private func pushHardButton() {
        timer.invalidate()
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateHardTimer), userInfo: nil, repeats: true)
        progressBar.progress = 0
        currentSeconds = 0
        self.questionLabel.text = "Готовим яички -_-"
    }
    
    @objc private func updateSoftTimer() {
        if  self.currentSeconds < self.secondsForSoftCook {
            self.currentSeconds += 1
            let percantageProgress = Float(self.currentSeconds) / Float(self.secondsForSoftCook)
            progressBar.progress = percantageProgress
        } else {
            timer.invalidate()
            questionLabel.text = "Готово :D"
        }
    }
    
    @objc private func updateMediumTimer() {
        if  self.currentSeconds < self.secondsForMediumCook {
            self.currentSeconds += 1
            let percantageProgress = Float(self.currentSeconds) / Float(self.secondsForMediumCook)
            progressBar.progress = percantageProgress
        } else {
            timer.invalidate()
            questionLabel.text = "Готово :D"
        }
    }
    
    @objc private func updateHardTimer() {
        if  self.currentSeconds < self.secondsForHardCook {
            self.currentSeconds += 1
            let percantageProgress = Float(self.currentSeconds) / Float(self.secondsForHardCook)
            progressBar.progress = percantageProgress
        } else {
            timer.invalidate()
            questionLabel.text = "Готово :D"
        }
    }
}
