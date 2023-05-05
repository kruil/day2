//
//  ViewController.swift
//  Day2
//
//  Created by Ilya Krupko on 05.05.23.
//

import UIKit

class ViewController: UIViewController {
    
    let customView = MainView()
    
    private lazy var secondVC: UIViewController = {
        let vc = UIViewController()
        vc.view.backgroundColor = .systemBackground
        vc.modalPresentationStyle = .pageSheet
        return vc
    }()
    
    override func loadView() {
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        customView.button3.addTarget(
            self,
            action: #selector(button3Click),
            for: .touchUpInside
        )
    }
    
    @objc
    func button3Click() {
        present(secondVC, animated: true)
    }
}

