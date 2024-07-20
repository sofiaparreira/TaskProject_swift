import UIKit

class AddTasksViewController: UIViewController, AddTasksViewHeaderDelegate {
    
    weak var delegate: TaskDelegate?
    
    private lazy var header: AddTasksViewHeader = {
        let header = AddTasksViewHeader(frame: .zero)
        header.translatesAutoresizingMaskIntoConstraints = false
        header.delegate = self
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
        button.addTarget(self, action: #selector(didTapSaveTaskButton), for: .touchUpInside)
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
    
    func didTapCloseButton() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func didTapSaveTaskButton() {
        guard let title = titleTextField.text, !title.isEmpty else {
            let alert = UIAlertController(title: "Attention", message: "You need a title", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        let newTask = Task(title: title, description: descriptionTextField.text)
        tasks.append(newTask)
        delegate?.didAddTask()
        dismiss(animated: true)
    }

    
}
