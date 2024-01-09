//
//  PostMainViewCell.swift
//  InstaPad
//
//  Created by Александр Фишер on 02.01.24.
//

import UIKit

class PostMainViewCell: UITableViewCell {

    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var nicknameLabel: UILabel = {
        let label = UILabel()
        //label.backgroundColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var underLabel: UILabel = {
        let label = UILabel()
        //label.backgroundColor = .yellow
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var timePostLabel: UILabel = {
        let label = UILabel()
        //label.backgroundColor = .green
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayot()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        avatarImageView.image = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(with user: UserData) {
        
        avatarImageView.image = user.avatarImage
        nicknameLabel.text = user.nickname
        nicknameLabel.font = UIFont.boldSystemFont(ofSize: 25)
        underLabel.text = "id:" + String(user.iD)
        underLabel.textColor = UIColor(named: "secondaryColor")
        underLabel.font = UIFont.italicSystemFont(ofSize: 21)
        timePostLabel.text = "last seen ° " + String(user.lastTimeOnline) + " min. ago"
        timePostLabel.font = UIFont.boldSystemFont(ofSize: 12)
        
    }
    
    private func setupLayot() {
        
        guard avatarImageView.superview == nil else {return}
        
        let mainStackView = UIStackView(arrangedSubviews: [nicknameLabel, underLabel,])
        mainStackView.spacing = 2
        mainStackView.axis = .vertical
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(avatarImageView)
        contentView.addSubview(mainStackView)
        contentView.addSubview(timePostLabel)
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            avatarImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            avatarImageView.heightAnchor.constraint(equalToConstant: 40),
            avatarImageView.widthAnchor.constraint(equalToConstant: 40),
            
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            mainStackView.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 20),
            
            timePostLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -10),
            timePostLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -20),
            timePostLabel.leadingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: 20),
            ])
        
    }
    
}




extension UITableViewCell {
    //class func tableRegister123(_ tableView: UITableView, for cell: UITableViewCell) {
    //    tableView.register(cell.self, forCellReuseIdentifier: String(describing: cell.self))
    //}
    static var reuseIdentifier: String { return String(describing: self) }
}
