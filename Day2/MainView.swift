//
//  MainView.swift
//  Day2
//
//  Created by Ilya Krupko on 05.05.23.
//

import UIKit

final class MainView: UIView {
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var button1 = button(title: "First Button")
    lazy var button2 = button(title: "Second Medium Button")
    lazy var button3 = button(title: "Third")
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .systemBackground
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(stackView)
        stackView.addArrangedSubview(button1)
        stackView.addArrangedSubview(button2)
        stackView.addArrangedSubview(button3)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    private func button(title: String) -> UIButton {
        var config = UIButton.Configuration.filled()
        config.title = title
        config.image = UIImage(systemName: "arrow.right.circle.fill")
        config.imagePlacement = .trailing
        config.imagePadding = 8
        config.contentInsets = .init(top: 10, leading: 14, bottom: 10, trailing: 14)
        let button  = UIButton(configuration: config)
        button.addTapScaleAnimation()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
}

extension UIButton {
    
    func addTapScaleAnimation() {
        addTarget(self, action: #selector(animateDown), for: [.touchDown])
        addTarget(self, action: #selector(animateUp), for: [.touchUpInside, .touchUpOutside, .touchCancel])
    }
    
    @objc private func animateDown(sender: UIButton) {
        animate(sender, transform: CGAffineTransform.identity.scaledBy(x: 0.7, y: 0.7))
    }
    
    @objc private func animateUp(sender: UIButton) {
        animate(sender, transform: .identity)
    }
    
    private func animate(_ button: UIButton, transform: CGAffineTransform) {
        UIView.animate(
            withDuration: 0.25,
            delay: 0,
            options: [.curveLinear, .beginFromCurrentState, .allowUserInteraction],
            animations: {
                button.transform = transform
            },
            completion: nil
        )
    }
    
}
