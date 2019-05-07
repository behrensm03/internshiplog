//
//  LogCollectionViewCell.swift
//  internshiplog
//
//  Created by Michael Behrens on 5/7/19.
//  Copyright © 2019 Michael Behrens. All rights reserved.
//

import UIKit

class LogCollectionViewCell: UICollectionViewCell {
    
    var dateLabel: UILabel!
    var companyLabel: UILabel!
    var productivityLabel: UILabel!
    var briefDescription: UITextView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        
        dateLabel = UILabel()
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        dateLabel.textColor = .white
        dateLabel.backgroundColor = Colors.main
        dateLabel.textAlignment = .left
        contentView.addSubview(dateLabel)
        
        companyLabel = UILabel()
        companyLabel.translatesAutoresizingMaskIntoConstraints = false
        companyLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        companyLabel.textColor = .white
        companyLabel.backgroundColor = Colors.main
        companyLabel.textAlignment = .right
        contentView.addSubview(companyLabel)
        
        productivityLabel = UILabel()
        productivityLabel.translatesAutoresizingMaskIntoConstraints = false
        productivityLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        productivityLabel.textColor = Colors.main
        productivityLabel.backgroundColor = .white
        productivityLabel.textAlignment = .right
        contentView.addSubview(productivityLabel)
        
        briefDescription = UITextView()
        briefDescription.isEditable = false
        briefDescription.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        briefDescription.textColor = Colors.main
        briefDescription.backgroundColor = .white
        briefDescription.textAlignment = .left
        contentView.addSubview(briefDescription)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            dateLabel.bottomAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -15),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.viewPadding/2),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -1*Constants.viewPadding/2)
            ])
        
        NSLayoutConstraint.activate([
            companyLabel.topAnchor.constraint(equalTo: dateLabel.topAnchor),
            companyLabel.bottomAnchor.constraint(equalTo: dateLabel.bottomAnchor),
            companyLabel.leadingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: Constants.viewPadding/2),
            companyLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -1*Constants.viewPadding/2)
            ])
        
        NSLayoutConstraint.activate([
            productivityLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 5),
            productivityLabel.bottomAnchor.constraint(equalTo: contentView.centerYAnchor),
            productivityLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -1*Constants.viewPadding/2),
            productivityLabel.leadingAnchor.constraint(equalTo: contentView.centerXAnchor)
            ])
        
        NSLayoutConstraint.activate([
            briefDescription.topAnchor.constraint(equalTo: productivityLabel.bottomAnchor),
            briefDescription.leadingAnchor.constraint(equalTo: dateLabel.leadingAnchor),
            briefDescription.trailingAnchor.constraint(equalTo: companyLabel.trailingAnchor),
            briefDescription.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ])
        
    }
    
    func configure(for log: Log) {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        
        dateLabel.text = formatter.string(from: log.date)
        companyLabel.text = log.company
        productivityLabel.text = "\u{2B51}"
        briefDescription.text = log.description
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
