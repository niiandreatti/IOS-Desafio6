//
//  ViewController2.swift
//  DesafioThreadNicolas
//
//  Created by Luccas Santana Marinho on 20/04/23.
//

import UIKit

protocol  AnotherViewControllerLogic: AnyObject {
    func displayAnotherInfo()
}

class AnotherViewController: UIViewController,AnotherViewControllerLogic {
    
    var interactor: AnotherViewInteractor?
    var router: AnotherControllerRouter?
    
    // MARK: Setup lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        
        setupUI()
       
    }
    
    // MARK: Setup itens view
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Boa garotoooooo"
        return label
    }()
    
    // MARK: Setup UI
    
    func setupUI() {
        view.addSubview(label)
        setupLayout()
    }
    
    // MARK: Setup Layout
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    func displayAnotherInfo() {
        print("Hello word")
    }
}
