//
//  ViewController.swift
//  InstaPad
//
//  Created by Александр Фишер on 09.12.23.
//

import Foundation
import UIKit

class MainPageViewController: UIViewController {

    lazy var tableView: UITableView = {
       
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = self
        table.delegate = self
        table.separatorStyle = .none
        //tableRegister123(tableView, for PostMainViewCell)
        table.register(PostMainViewCell.self, forCellReuseIdentifier: PostMainViewCell.reuseIdentifier)
        //table.register(UITableViewCell.self, forCellReuseIdentifier: "MainLentaId")
        return table
    }()
    
    var dataSource: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        dataSource = ["Nutzer 1", "Nutzer 2", "Nutzer 3", "Nutzer 4", "Nutzer 5", "Nutzer 6", "Nutzer 7", "Nutzer 8", "Nutzer 9", "Nutzer 10", "Nutzer 11", "Nutzer 12", "Nutzer 13", "Nutzer 14", "Nutzer 15", "Nutzer 16", "Nutzer 17", "Nutzer 18", "Nutzer 19", "Nutzer 20", "Nutzer 21", "Nutzer 22", "Nutzer 23", "Nutzer 24", "Nutzer 25", "Nutzer 26", "Nutzer 27", "Nutzer 28", ]
         
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        }
}

extension MainPageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostMainViewCell.reuseIdentifier, for: indexPath)

//        let model = dataSource[indexPath.row]
//        var listConfiguration = cell.defaultContentConfiguration()
//        var backgroundConfiguration = cell.defaultBackgroundConfiguration()
//        
//        listConfiguration.text = model
//        listConfiguration.secondaryText = "New message"
//        listConfiguration.secondaryTextProperties.font = UIFont.systemFont(ofSize: 21)
//                
//        backgroundConfiguration.backgroundColor = .darkGray
//        backgroundConfiguration.cornerRadius = 10
//        backgroundConfiguration.backgroundInsets = .init(top: 5, leading: 5, bottom: 5, trailing: 5)
//        
//        cell.contentConfiguration = listConfiguration
//        cell.backgroundConfiguration = backgroundConfiguration
        
        return cell
    }
    
    
}
