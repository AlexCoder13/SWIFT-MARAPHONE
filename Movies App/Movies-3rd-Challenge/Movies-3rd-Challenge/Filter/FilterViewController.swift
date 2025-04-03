//
//  FilterViewController.swift
//  Movies-3rd-Challenge
//
//  Created by Александр Семёнов on 03.04.2025.
//

import UIKit

// Протокол для передачи выбранных фильтров обратно в вызывающий контроллер
protocol FilterViewControllerDelegate: AnyObject {
    // Вызывается когда пользователь применяет выбранные фильтры
    func filterViewController(_ controller: FilterViewController, didApplyFilters category: String?, rating: Int?)
    
    // Вызывается когда пользователь сбрасывает фильтры
    func filterViewControllerDidReset(_ controller: FilterViewController)
}


class FilterViewController: UIViewController {
    
    // MARK: - Properties
    
    // Делегат для обработки выбранных фильтров
    weak var delegate: FilterViewControllerDelegate?
    
    // Доступ к основному view как к FilterView
    private var filterView: FilterView {
        return view as! FilterView
    }
    
    // Выбранная категория
    private var selectedCategory: String?
    
    // Выбранный рейтинг
    private var selectedRating: Int?
    
    // MARK: - Lifecycle
    override func loadView() {
        self.view = FilterView()
        filterView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
    
    // MARK: - Setup
    
    // Настройка свойств контроллера представления
    private func setupViewController() {
        // Меняем на модальный стиль презентации
        modalPresentationStyle = .formSheet
        
        if let sheet = sheetPresentationController {
            // Устанавливаем детент (высоту) для экрана фильтра
            sheet.detents = [.custom { context in
                // Фиксированная высота для экрана фильтров, чуть ниже центра
                return 480
            }]
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 20
        }
    }
    
    // MARK: - Public methods
    
    // Устанавливает начальные значения фильтров
    func setInitialFilters(category: String?, rating: Int?) {
        selectedCategory = category
        selectedRating = rating
    }
}

// MARK: - FilterViewDelegate
extension FilterViewController: FilterViewDelegate {
    // Обрабатывает нажатие на кнопку закрытия
    func didTapCloseButton() {
        dismiss(animated: true)
    }
    
    // Обрабатывает нажатие на кнопку сброса фильтров
    func didTapResetFiltersButton() {
        selectedCategory = nil
        selectedRating = nil
        delegate?.filterViewControllerDidReset(self)
        dismiss(animated: true)
    }
    
    // Обрабатывает нажатие на кнопку применения фильтров
    func didTapApplyFiltersButton() {
        // Получаем выбранные фильтры из view
        selectedCategory = filterView.getSelectedCategory()
        selectedRating = filterView.getSelectedRating()
        
        delegate?.filterViewController(self, didApplyFilters: selectedCategory, rating: selectedRating)
        dismiss(animated: true)
    }
}

