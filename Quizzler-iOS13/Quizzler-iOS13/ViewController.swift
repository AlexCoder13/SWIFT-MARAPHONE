//
//  ViewController.swift
//  Quizzler-iOS13

import UIKit

class ViewController: UIViewController {
    
    private var questions = [
        Question(text: "Согласно тексту песни группы 'Пикник' - У шамана три руки", answer: "ДА, ЭТО ТАК"),
        Question(text: "В солнечной системе 9 планет", answer: "НЕТ, ЭТО НЕ ТАК"),
        Question(text: "Франшиза 'Назад в будущее' насчитывает три фильма", answer: "ДА, ЭТО ТАК"),
        Question(text: "Лучшего друга Гарри Поттера звали Драко Малфой", answer: "НЕТ, ЭТО НЕ ТАК"),
        Question(text: "'Валл-и' это мультфильм студии 'Disney'", answer: "ДА, ЭТО ТАК"),
    ]
    
    private var questionIndex = 0
    
    private var trueAnswers = 0
    private var falseAnswers = 0
    
    private lazy var beginButton: UIButton = {
        let beginButton = UIButton()
        beginButton.setTitle("НАЧАТЬ", for: .normal)
        beginButton.setTitleColor(.white, for: .highlighted)
        beginButton.titleLabel?.font = .boldSystemFont(ofSize: 40)
        beginButton.backgroundColor = .systemMint
        beginButton.layer.cornerRadius = 20
        beginButton.addTarget(self, action: #selector(pushBeginButton), for: .touchUpInside)
        beginButton.translatesAutoresizingMaskIntoConstraints = false
        return beginButton
    }()
    
    private lazy var trueButtonImage: UIImageView = {
        let trueButtonImage = UIImageView()
        trueButtonImage.image = UIImage(named: "Rectangle")
        trueButtonImage.isHidden = true
        trueButtonImage.translatesAutoresizingMaskIntoConstraints = false
        return trueButtonImage
    }()
    
    private lazy var falseButtonImage: UIImageView = {
        let falseButtonImage = UIImageView()
        falseButtonImage.image = UIImage(named: "Rectangle")
        falseButtonImage.isHidden = true
        falseButtonImage.translatesAutoresizingMaskIntoConstraints = false
        return falseButtonImage
    }()
    
    private lazy var trueButton: UIButton = {
        let trueButton = UIButton()
        trueButton.setTitle("ДА, ЭТО ТАК", for: .normal)
        trueButton.setTitleColor(.white, for: .normal)
        trueButton.titleLabel?.font = .boldSystemFont(ofSize: 30)
        trueButton.backgroundColor = .clear
        trueButton.layer.cornerRadius = 20
        trueButton.isHidden = true
        trueButton.addTarget(self, action: #selector(pushTrueButton), for: .touchUpInside)
        trueButton.translatesAutoresizingMaskIntoConstraints = false
        return trueButton
    }()
    
    private lazy var falseButton: UIButton = {
        let falseButton = UIButton()
        falseButton.setTitle("НЕТ, ЭТО НЕ ТАК", for: .normal)
        falseButton.setTitleColor(.white, for: .highlighted)
        falseButton.titleLabel?.font = .boldSystemFont(ofSize: 30)
        falseButton.backgroundColor = .clear
        falseButton.layer.cornerRadius = 20
        falseButton.isHidden = true
        falseButton.addTarget(self, action: #selector(pushFalseButton), for: .touchUpInside)
        falseButton.translatesAutoresizingMaskIntoConstraints = false
        return falseButton
    }()
    
    private lazy var mainLabel: UILabel = {
        let mainLabel = UILabel()
        mainLabel.text = questions[questionIndex].text
        mainLabel.font = .boldSystemFont(ofSize: 25)
        mainLabel.textColor = .lightText
        mainLabel.numberOfLines = 0
        mainLabel.textAlignment = .center
        mainLabel.isHidden = true
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        return mainLabel
    }()
    
    private lazy var progressBar: UIProgressView = {
        let progressBar = UIProgressView()
        progressBar.progressViewStyle = .bar
        progressBar.progressTintColor = .systemMint
        progressBar.trackTintColor = .systemGray
        progressBar.layer.cornerRadius = 7
        progressBar.clipsToBounds = true
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        progressBar.isHidden = true
        return progressBar
    }()
    
    
    override func viewDidLoad() {
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        view.backgroundColor = .placeholderText
        
        view.addSubview(mainLabel)
        
        view.addSubview(beginButton)
        view.addSubview(trueButton)
        view.addSubview(falseButton)
        
        view.addSubview(trueButtonImage)
        view.addSubview(falseButtonImage)
        
        view.addSubview(progressBar)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
            mainLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            mainLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            beginButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            beginButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            beginButton.heightAnchor.constraint(equalToConstant: 60),
            beginButton.widthAnchor.constraint(equalToConstant: 200),
            
            trueButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            trueButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200),
            trueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            trueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            trueButton.heightAnchor.constraint(equalToConstant: 60),
            
            falseButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            falseButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            falseButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            falseButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            falseButton.heightAnchor.constraint(equalToConstant: 60),
            
            trueButtonImage.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            trueButtonImage.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -195),
            trueButtonImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            trueButtonImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            falseButtonImage.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            falseButtonImage.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -95),
            falseButtonImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            falseButtonImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            progressBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            progressBar.centerYAnchor.constraint(equalTo: view.bottomAnchor, constant: -70),
            progressBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            progressBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            progressBar.heightAnchor.constraint(equalToConstant: 7)
        ])
    }
    
    @objc private func pushBeginButton() {
        self.mainLabel.isHidden = false
        self.beginButton.isHidden = true
        self.trueButton.isHidden = false
        self.falseButton.isHidden = false
        self.trueButtonImage.isHidden = false
        self.falseButtonImage.isHidden = false
        progressBar.isHidden = false
    }
    
    @objc private func pushTrueButton() {
        if questionIndex + 1 < questions.count {
            countTruePoints()
            countProgress()
            self.questionIndex += 1
            self.mainLabel.text = questions[questionIndex].text
            self.trueButton.backgroundColor = .clear
        } else {
            countTruePoints()
            countProgress()
            self.trueButton.isHidden = true
            self.falseButton.isHidden = true
            self.trueButtonImage.isHidden = true
            self.falseButtonImage.isHidden = true
            self.mainLabel.text = "Викторина окончена. Правильных ответов: \(self.trueAnswers)"
        }
    }
    
    @objc private func pushFalseButton() {
        if questionIndex + 1 < questions.count {
            countFalsePoints()
            countProgress()
            self.questionIndex += 1
            self.mainLabel.text = questions[questionIndex].text
        } else {
            countFalsePoints()
            countProgress()
            self.trueButton.isHidden = true
            self.falseButton.isHidden = true
            self.trueButtonImage.isHidden = true
            self.falseButtonImage.isHidden = true
            self.mainLabel.text = "Викторина окончена. Правильных ответов: \(self.trueAnswers)"
        }
    }
    
    private func countTruePoints() {
        if questions[questionIndex].answer == self.trueButton.titleLabel?.text {
            self.trueAnswers += 1
            UIView.animate(withDuration: 0.2, delay: 0.0, options:[.curveEaseIn], animations: {
                self.trueButton.backgroundColor = .systemGreen
            })
            UIView.animate(withDuration: 0.2, delay: 0.0, options:[.curveEaseOut], animations: {
                self.trueButton.backgroundColor = .clear
            })
        } else {
            UIView.animate(withDuration: 0.2, delay: 0.0, options:[.curveEaseIn], animations: {
                self.trueButton.backgroundColor = .systemRed
            })
            UIView.animate(withDuration: 0.2, delay: 0.0, options:[.curveEaseOut], animations: {
                self.trueButton.backgroundColor = .clear
            })
            print("Ответ неверный")
        }
    }
    private func countFalsePoints() {
        if questions[questionIndex].answer == self.falseButton.titleLabel?.text {
            self.trueAnswers += 1
            UIView.animate(withDuration: 0.2, delay: 0.0, options:[.curveEaseIn], animations: {
                self.falseButton.backgroundColor = .systemGreen
            })
            UIView.animate(withDuration: 0.2, delay: 0.0, options:[.curveEaseOut], animations: {
                self.falseButton.backgroundColor = .clear
            })
        } else {
            UIView.animate(withDuration: 0.2, delay: 0.0, options:[.curveEaseIn], animations: {
                self.falseButton.backgroundColor = .systemRed
            })
            UIView.animate(withDuration: 0.2, delay: 0.0, options:[.curveEaseOut], animations: {
                self.falseButton.backgroundColor = .clear
            })
            print("Ответ неверный")
        }
    }
    
    private func countProgress() {
        let percantageProgress = Float(self.questionIndex + 1) / Float(self.questions.count)
        progressBar.progress = percantageProgress
    }
}

