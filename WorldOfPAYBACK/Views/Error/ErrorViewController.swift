//
//  ErrorViewController.swift
//  WorldOfPAYBACK
//
//  Created by Felipe Andrade on 26/03/23.
//

import UIKit
import PBCore

class ErrorViewController: BaseUIKitViewController {
    
    lazy var labelDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = """
            We are working to improve and fix this,
            you can aways try again!
        """
        label.textAlignment = .center
        label.textColor = .gray
        label.numberOfLines = 3
        return label
    }()
    
    lazy var labelTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "We got an error"
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    lazy var mainImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "exclamationmark.triangle.fill")
        imageView.tintColor = .systemRed
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        button.tintColor = .darkBluePB
        return button
    }()
    
    lazy var tryAgainButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Try Again", for: .normal)
        button.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        button.tintColor = .white
        button.backgroundColor = .darkBluePB
        button.layer.cornerRadius = 25
        return button
    }()
    
    var error: PBError
    
    init(error: PBError) {
        self.error = error
        super.init(isViewCode: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        view.backgroundColor = .white
        setupViews()
    }
    
    func setupViews() {
        addViewHierarchy()
        addConstraints()
    }
    
    func addViewHierarchy() {
        view.addSubview(labelTitle)
        view.addSubview(backButton)
        view.addSubview(mainImage)
        view.addSubview(labelDescription)
        view.addSubview(tryAgainButton)
    }
    
    @objc func backAction() {
        navigationController?.popViewController(animated: true)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            labelTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30),
            
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            backButton.heightAnchor.constraint(equalToConstant: 30),
            backButton.widthAnchor.constraint(equalToConstant: 30),
            
            mainImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainImage.bottomAnchor.constraint(equalTo: labelTitle.topAnchor, constant: -40),
            mainImage.heightAnchor.constraint(equalToConstant: 150),
            mainImage.widthAnchor.constraint(equalToConstant: 150),
            
            labelDescription.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelDescription.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 12),
            labelDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            labelDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            tryAgainButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tryAgainButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tryAgainButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -12),
            tryAgainButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
