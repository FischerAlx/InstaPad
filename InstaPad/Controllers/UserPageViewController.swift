//
//  UserPageViewController.swift
//  InstaPad
//
//  Created by Александр Фишер on 09.12.23.
//

import Foundation
import UIKit

class UserPageViewController: UIViewController {

    lazy var label: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 21)
        
        return label
    }()
    
    init(with user: UserData) {
        super.init(nibName: nil, bundle: nil)
        
        label.text = user.nickname 
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        view.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
        ])
        
    }


}
