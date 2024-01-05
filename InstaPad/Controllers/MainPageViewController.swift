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
        table.register(PostMainViewCell.self, forCellReuseIdentifier: PostMainViewCell.reuseIdentifier)
        //table.register(UITableViewCell.self, forCellReuseIdentifier: "MainLentaId")
        //tableRegister123(tableView, for PostMainViewCell)
        return table
    }()
    
    var dataSource: [UserData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        for _ in 0 ..< 25 {
            dataSource.append(UserData(iD: Int.random(in: 0 ... 99999999999999), nickname: "regularUser" + "­\(Int.random(in: 1..<100))", avatarImage: UIImage(named: "avatar"), lastTimeOnline: Int.random(in: 1 ... 60)))
        }
        //UIImage(named: "avatar")
                
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
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
        let cell = tableView.dequeueReusableCell(withIdentifier: PostMainViewCell.reuseIdentifier, for: indexPath) as! PostMainViewCell

        let user = dataSource[indexPath.row]
        cell.configureCell(with: user)

        
        return cell
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
    }
    
    
}
