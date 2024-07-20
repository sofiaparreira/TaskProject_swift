//
//  TaksTableViewHeader.swift
//  ToDoList
//
//  Created by Sofia on 16/07/24.
//

import UIKit

protocol TasksTableViewHeaderDelegate: AnyObject {
    func didTapAddTaskButton()
}

class TaksTableViewHeader: UIView {
    weak var delegate: TasksTableViewHeaderDelegate?

    private lazy var titleLabel: UILabel =  {
        let label = UILabel()
        label.text = "Tarefas"
        label.font = .systemFont(ofSize: 20.0, weight: .bold)
        label.textColor = UIColor(named: AssetsConstants.darkPurple)
        return label
    }()
    
    private lazy var addTaksButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let plusImg = UIImage(systemName: "plus")
        button.setImage(plusImg, for: .normal)
        button.addTarget(self, action: #selector(didTapTaskButton), for: .touchUpInside)
       return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func didTapTaskButton() {
        delegate?.didTapAddTaskButton()
    }
    
    private func addSubviews() {
        addSubview(titleLabel)
        addSubview(addTaksButton)
    }
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            addTaksButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20.0),
            addTaksButton.centerYAnchor.constraint(equalTo: centerYAnchor)
            
        ])
    }

}
