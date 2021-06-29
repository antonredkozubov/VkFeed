//
//  AuthViewController.swift
//  VkFeed
//
//  Created by Anton Redkozubov on 28.06.2021.
//

import UIKit
import SnapKit

class AuthViewController: UIViewController {

    private var authService: AuthService!

    // MARK: - Subviews
    private lazy var logInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Войти в vk", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.2901960784, green: 0.462745098, blue: 0.6588235294, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.layer.cornerRadius = 8
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        authService = SceneDelegate.shared().authService

        logInButton.addTarget(self, action: #selector(singInTouch), for: .touchUpInside)
    }

    // MARK: - Actions
    @objc func singInTouch() {
        print(#function)
        authService.wakeUpSession()
    }

    // MARK: - Constrains
    override func loadView() {
        super.loadView()

        view.addSubview(logInButton)

        logInButton.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.height.equalTo(40)
            $0.width.equalTo(140)
        }
    }

}
