import UIKit

protocol AddTasksViewHeaderDelegate: AnyObject {
    func didTapCloseButton()
}

class AddTasksViewHeader: UIView {

    weak var delegate: AddTasksViewHeaderDelegate?

    private lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Adicionar Tarefa"
        title.font = .systemFont(ofSize: 24.0, weight: .bold)
        title.textAlignment = .center
        return title
    }()
    
    private lazy var closeButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        let closeImg = UIImage(systemName: "xmark")
        btn.setImage(closeImg, for: .normal)
        btn.addTarget(self, action: #selector(didTapCloseButton), for: .touchUpInside)
        return btn
    }()
    
    @objc private func didTapCloseButton() {
        delegate?.didTapCloseButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews() {
        addSubview(titleLabel)
        addSubview(closeButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20.0),
            closeButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}

class AddTaskViewController: UIViewController {

    private lazy var header: AddTasksViewHeader = {
        let header = AddTasksViewHeader(frame: .zero)
        header.translatesAutoresizingMaskIntoConstraints = false
        header.delegate = self // Configurando o delegate
        return header
    }()
    
    private lazy var labelTitle: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Título"
        title.font = .systemFont(ofSize: 20.0, weight: .semibold)
        return title
    }()
    
    private lazy var labelDescription: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "Descrição"
        return text
    }()
    
    private lazy var titleTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private lazy var descriptionTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private lazy var buttonSave: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Salvar", for: .normal)
        button.setTitleColor(UIColor(named: AssetsConstants.lilac), for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(header)
        view.addSubview(labelTitle)
        view.addSubview(titleTextField)
        view.addSubview(labelDescription)
        view.addSubview(descriptionTextField)
        view.addSubview(buttonSave)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32.0),
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            header.heightAnchor.constraint(equalToConstant: 64.0),
            
            labelTitle.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 20),
            labelTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20.0),
            
            titleTextField.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 20),
            titleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20.0),
            titleTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20.0),
            titleTextField.heightAnchor.constraint(equalToConstant: 40.0),
            
            labelDescription.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 40.0),
            labelDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20.0),
            
            descriptionTextField.topAnchor.constraint(equalTo: labelDescription.bottomAnchor, constant: 20.0),
            descriptionTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20.0),
            descriptionTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20.0),
            descriptionTextField.heightAnchor.constraint(equalToConstant: 40.0),
            
            buttonSave.topAnchor.constraint(equalTo: descriptionTextField.bottomAnchor, constant: 40.0),
            buttonSave.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

extension AddTaskViewController: AddTasksViewHeaderDelegate {
    func didTapCloseButton() {
        navigationController?.popViewController(animated: true)
    }
}
