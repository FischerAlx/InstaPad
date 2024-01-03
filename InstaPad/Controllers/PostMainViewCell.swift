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
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var underLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var timePostLabel: UILabel = {
        let label = UILabel()
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
    
    private func setupLayot() {
        
        guard avatarImageView.superview == nil else {return}
        
        var mainStackView = UIStackView(arrangedSubviews: [nicknameLabel, underLabel,])
        
        contentView.addSubview(avatarImageView)
        contentView.addSubview(mainStackView)
        contentView.addSubview(timePostLabel)
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            avatarImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            timePostLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            timePostLabel.leadingAnchor.constraint(equalTo: trailingAnchor, constant: 50),
        ])
        
    }
    
}




extension UITableViewCell {
    //class func tableRegister123(_ tableView: UITableView, for cell: UITableViewCell) {
    //    tableView.register(cell.self, forCellReuseIdentifier: String(describing: cell.self))
    //}
    static var reuseIdentifier: String { return String(describing: self) }
}
