import UIKit

protocol ViewControllerLogic: AnyObject {
    func displayHelloWorld()
}

class ViewController: UIViewController, ViewControllerLogic {
    
    // MARK: Properties
    
    var interactor: InteractorLogic?
    var router: ViewControllerRouter?
    
    // MARK: Setup Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupUI()
        router = ViewControllerRouter()
        router?.viewController = self
    }
    
    // MARK: Setup UI
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitle("Toque aqui", for: .normal)
        button.addTarget(self, action: #selector(setupFunc), for: .touchUpInside)
        return button
    }()
    
    func setupUI() {
        view.addSubview(button)
        setupLayout()
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 60),
            button.heightAnchor.constraint(equalToConstant: 55),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    // MARK: Actions
    
    @objc func setupFunc() {
        let alert = UIAlertController(title: "Resolva essa thread", message: "Agora é com você", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Sim", style: .default, handler: { _ in
            self.navigating()
        }))
        present(alert, animated: true, completion: nil)
    }

    @objc func navigating() {
        router?.navigateTopushedController()
    }
    
    // MARK: ViewControllerLogic
    
    func displayHelloWorld() {
        print("Hello world!")
    }
}

