import UIKit


protocol TaskDelegate: AnyObject {
    func didAddTask()
}
class TaskViewController: UIViewController {
    
    
    private lazy var taskImgView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: AssetsConstants.taskIllustration))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var tasksTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.layer.cornerRadius = 32.0
        let header = TaksTableViewHeader(frame: .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 64.0))
        header.delegate = self
        tableView.tableHeaderView = header
        return tableView
    }()
    
    private func createTaskCheckButton(task: Task) -> UIButton {
        let completeButton = UIButton()
        completeButton.addTarget(self, action: #selector(didTapCompleteTaskButton), for: .touchUpInside)
        let image = UIImage(systemName: task.isCompleted ? "checkmark.circle.fill" : "checkmark.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 24.0))
        completeButton.setImage(image, for: .normal)
        completeButton.frame = .init(x: 0, y: 0, width: 24, height: 24)
        return completeButton
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        addGradientBackground()
        addSubviews()
        setupConstraints()
    }
    
    private func setupNavigationBar() {
        navigationItem.hidesBackButton = true
    }
    
    private func addSubviews() {
        view.addSubview(tasksTableView)
        view.addSubview(taskImgView)
    }
    
    @objc func didTapCompleteTaskButton(_ sender:UIButton) {
        guard let cell = sender.superview as? UITableViewCell else {
            return
        }
        guard let indexPath = tasksTableView.indexPath(for: cell) else {return}
        tasks[indexPath.row].isCompleted.toggle()
        tasksTableView.reloadRows(at: [indexPath], with: .automatic)
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            taskImgView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            taskImgView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            taskImgView.heightAnchor.constraint(equalToConstant: 250.0),
            
            tasksTableView.topAnchor.constraint(equalTo: taskImgView.bottomAnchor),
            tasksTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tasksTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tasksTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension TaskViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = tasks[indexPath.row].title
        content.secondaryText = tasks[indexPath.row].description ?? ""
        cell.contentConfiguration = content
        cell.accessoryView = createTaskCheckButton(task: tasks[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tasks.remove(at: indexPath.row)
            tasksTableView.reloadData()
        }
    }
}

extension TaskViewController: TasksTableViewHeaderDelegate {
    func didTapAddTaskButton() {
        let addTaskVC = AddTasksViewController()
        addTaskVC.delegate = self
        navigationController?.present(addTaskVC, animated: true)
    }
}

extension TaskViewController: TaskDelegate {
    func didAddTask() {
        tasksTableView.reloadData()
    }
    
    
}
