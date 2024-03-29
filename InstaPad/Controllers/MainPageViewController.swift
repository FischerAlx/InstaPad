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
        //table.dataSource = self
        table.delegate = self
        table.separatorStyle = .none
        table.register(PostMainViewCell.self, forCellReuseIdentifier: PostMainViewCell.reuseIdentifier)
        //table.register(UITableViewCell.self, forCellReuseIdentifier: "MainLentaId")
        //tableRegister123(tableView, for PostMainViewCell)
        return table
    }()
    
    var users: [UserData] = []
    var dataSource: UITableViewDiffableDataSource<Int, UserData>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        for _ in 0 ..< 5 {
            users.append(UserData(iD: Int.random(in: 99999999+1 ..< 999999999+1), nickname: "regularUser" + "­\(Int.random(in: 1 ..< 100))", avatarImage: UIImage(systemName: "person.crop.circle"), lastTimeOnline: Int.random(in: 1 ..< 60)))
        }
        //UIImage(named: "avatar")
            
        view.addSubview(tableView)
        
        setupLayot()
        setupNavigationBar()
        setupDataSource()
        }
    
    func setupDataSource() {
        dataSource = UITableViewDiffableDataSource(tableView: tableView, cellProvider: { tableView, indexPath, user in
            let cell = tableView.dequeueReusableCell(withIdentifier: PostMainViewCell.reuseIdentifier, for: indexPath) as! PostMainViewCell
            cell.configureCell(with: user)
            cell.delegate = self
            return cell
        })
        
        updateDataSource(with: users)
    }
    
    func updateDataSource(with users: [UserData]) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, UserData>()
        snapshot.appendSections([0])
        snapshot.appendItems(users)
        dataSource?.apply(snapshot)
    }
    
    
    
    func setupLayot() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    
    
    
    func setupNavigationBar() {
        let editAction = UIAction(handler: { _ in
            self.tableView.isEditing.toggle()
            if !self.tableView.isEditing {
                self.tableView.reloadData()
            }
        })
        
        let addAction = UIAction(handler: { _ in
            self.users.append(UserData(iD: Int.random(in: 99999999+1 ..< 999999999+1), nickname: "regularUser" + "­\(Int.random(in: 1 ..< 100))", avatarImage: UIImage(systemName: "person.crop.circle"), lastTimeOnline: Int.random(in: 1 ..< 60)))
            self.updateDataSource(with: self.users)
        })
        
        navigationItem.title = "Schapka"
        navigationItem.leftBarButtonItem = UIBarButtonItem(systemItem: .edit, primaryAction: editAction, menu: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .add, primaryAction: addAction, menu: nil)
        
    }
}









extension MainPageViewController: UserCellDelegate {
    func didPressDetailDisclosure() {
        let alert = UIAlertController(title: "Wow", message: "Hello World!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
}

extension MainPageViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let user = dataSource?.itemIdentifier(for: indexPath) {
            navigationController?.pushViewController(UserPageViewController(with: user), animated: true)
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    /*func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostMainViewCell.reuseIdentifier, for: indexPath) as! PostMainViewCell

        let user = users[indexPath.row]
        cell.configureCell(with: user)

        
        return cell
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let post = users[sourceIndexPath.row]
        users.remove(at: sourceIndexPath.row)
        users.insert(post, at: destinationIndexPath.row)
        
        tableView.reloadData()
//        if destinationIndexPath.row < sourceIndexPath.row {
//            tableView.reloadRows(at: [destinationIndexPath, sourceIndexPath], with: .automatic)
//        } else {
//            tableView.reloadRows(at: [sourceIndexPath, destinationIndexPath], with: .automatic)
//        }
    }
    
    */
}
