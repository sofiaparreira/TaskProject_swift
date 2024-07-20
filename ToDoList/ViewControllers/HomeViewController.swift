import UIKit

class HomeViewController: UIViewController {

    private lazy var logoImgView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: AssetsConstants.logo))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var homeImgView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: AssetsConstants.homeIllustration))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var getReadyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Prepare-se para conquistar o dia, uma lista de cada vez."
        label.textColor = UIColor(named: AssetsConstants.darkPurple)
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 22.0, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var getReadyButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Vamos Começar?", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18.0, weight: .bold)
        button.backgroundColor = UIColor(named: AssetsConstants.darkPurple)
        button.layer.cornerRadius = 12.0
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTapGetStartedButton), for: .touchUpInside)
        return button
        
    }()
    
    
    @objc func didTapGetStartedButton(){
        navigationController?.pushViewController(TaskViewController(), animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGradientBackground()
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews(){
        view.addSubview(logoImgView)
        view.addSubview(homeImgView)
        view.addSubview(getReadyLabel)
        view.addSubview(getReadyButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            logoImgView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            logoImgView.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            homeImgView.topAnchor.constraint(equalTo: logoImgView.bottomAnchor, constant: 32.0),
            homeImgView.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            getReadyLabel.topAnchor.constraint(equalTo: homeImgView.bottomAnchor, constant: 32.0),
            getReadyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20.0),
            getReadyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20.0),
            
            getReadyButton.topAnchor.constraint(equalTo: getReadyLabel.bottomAnchor, constant: 32.0),
            getReadyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80.0),
            getReadyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80.0),
            getReadyButton.heightAnchor.constraint(equalToConstant: 40.0)
        ])
    }
}
