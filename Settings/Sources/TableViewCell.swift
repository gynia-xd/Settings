//
//  TableViewCell.swift
//  Settings
//
//  Created by Пётр  on 06.04.2023.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    var cell: Cell? {
        didSet {
            if let cell = cell {
                titleLabel.text = cell.name
                iconImage.backgroundColor = cell.color
                if cell.isSystem {
                    iconImage.image = UIImage(systemName: cell.icon)
                } else {
                    iconImage.image = UIImage(named: cell.icon)
                }
            }
        }
    }
    
    // MARK: - Outlets
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 4
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    
    
    // MARK: - Inits
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarhy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    // MARK: - Setups
    
    private func setupHierarhy() {
        addSubview(titleLabel)
        addSubview(iconImage)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            iconImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 20),
            iconImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            iconImage.widthAnchor.constraint(equalToConstant: 25),
            iconImage.heightAnchor.constraint(equalToConstant: 25),
            
            titleLabel.centerYAnchor.constraint(equalTo: iconImage.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: 20)
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        // for phantom
        accessoryView = nil
        self.cell = nil
    }
}
