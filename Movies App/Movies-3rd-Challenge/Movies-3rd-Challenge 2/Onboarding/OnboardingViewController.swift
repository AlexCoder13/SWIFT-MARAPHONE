//
//  OnboardingViewController.swift
//  Movies-3rd-Challenge
//
//  Created by Александр Семёнов on 31.03.2025.
//
import UIKit

// Контроллер для отображения экранов онбординга
final class OnboardingViewController: UIViewController {
    
    // MARK: - Properties
    
    // Главное представление онбординга
    private let onboardingView = OnboardingView()
    
    // Массив слайдов с данными для отображения (изображение, заголовок, описание)
    private let slides: [(image: String, title: String, description: String)] = [
        ("FirstSlide", "Watch your favorite movie easily", "Discover the world of high-quality video content and enjoy it with us. Find your movie."),
        ("SecondSlide", "Watch on any Device", "Stream on your phone, tablet, laptop, and TV without paying more."),
        ("TomCruse", "Download and Go", "Save your data, watch offline on a plane,train, or rocket."),
    ]
    
    // Коллекция для отображения слайдов онбординга
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.isPagingEnabled = true
        cv.showsHorizontalScrollIndicator = false
        cv.delegate = self
        cv.dataSource = self
        cv.register(OnboardingCell.self, forCellWithReuseIdentifier: "OnboardingCell")
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.clipsToBounds = false
        return cv
    }()
    
    // Индикатор текущей страницы онбординга
    private let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPageIndicatorTintColor = .onboardingBG
        pc.pageIndicatorTintColor = .systemGray2
        pc.translatesAutoresizingMaskIntoConstraints = false
        return pc
    }()
    
    // MARK: - Lifecycle Methods
    
    // Скрываем таб-бар при отображении онбординга
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    
    // Показываем таб-бар после завершения онбординга
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    // Устанавливаем пользовательское представление
    override func loadView() {
        view = onboardingView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // Обновляем layout коллекции при изменении размеров
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
    // MARK: - UI Setup
    
    // Настройка пользовательского интерфейса
    private func setupUI() {
        view.addSubview(collectionView)
        view.addSubview(pageControl)
        
        pageControl.numberOfPages = slides.count
        pageControl.transform = CGAffineTransform(scaleX: 1.5, y: 1.5) // Увеличиваем размер точек
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -397)
        ])
    }
    
    // MARK: - Button Actions
    
    // Обработчик нажатия на кнопку начала использования приложения
    @objc private func startButtonTapped() {
        let homeVC = TabBarController()
        homeVC.modalPresentationStyle = .fullScreen
        present(homeVC, animated: true)
    }
    
    // Прокручивает к следующему слайду
    private func scrollToNextSlide() {
        let currentPage = pageControl.currentPage
        if currentPage < slides.count - 1 {
            let indexPath = IndexPath(item: currentPage + 1, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            pageControl.currentPage = currentPage + 1
        }
    }
}

// MARK: - UICollectionViewDelegate & DataSource
extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, OnboardingCellDelegate {
    
    // Возвращает количество элементов в секции коллекции
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    // Создает и настраивает ячейку для отображения слайда
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "OnboardingCell",
            for: indexPath
        ) as! OnboardingCell
        
        let slide = slides[indexPath.item]
        let isLastCell = indexPath.item == slides.count - 1
        
        cell.delegate = self
        cell.indexPath = indexPath
        cell.configure(
            image: slide.image,
            additionalImages: isLastCell ? ["LeftMovie", "RightMovie"] : nil,
            title: slide.title,
            description: slide.description,
            isLastCell: isLastCell
        )
        
        return cell
    }
    
    // Возвращает размер ячейки (во весь размер коллекции)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
    
    // Обновляет индикатор страницы при прокрутке
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = round(scrollView.contentOffset.x / scrollView.bounds.width)
        pageControl.currentPage = Int(page)
    }
    
    // MARK: - OnboardingCellDelegate
    
    // Обработчик нажатия на кнопку продолжения в ячейке
    func didTapContinueButton(at index: Int) {
        scrollToNextSlide()
    }
    
    // Обработчик нажатия на кнопку начала в последней ячейке
    func didTapStartButton() {
        startButtonTapped()
    }
}
