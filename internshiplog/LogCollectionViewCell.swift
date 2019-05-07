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
    var topView: UIView!
    var bottomView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = Colors.randomColor()
        contentView.layer.cornerRadius = 12.0
        contentView.layer.shadowColor = UIColor.lightGray.cgColor
        contentView.layer.shadowOffset = CGSize(width: 2.0, height: 4.0)
        contentView.layer.shadowRadius = 2.0
        contentView.layer.shadowOpacity = 1.0
        contentView.layer.masksToBounds = false
        
        dateLabel = UILabel()
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        dateLabel.textColor = .white
        dateLabel.textAlignment = .left
        contentView.addSubview(dateLabel)
        
        companyLabel = UILabel()
        companyLabel.translatesAutoresizingMaskIntoConstraints = false
        companyLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        companyLabel.textColor = .white
        companyLabel.textAlignment = .right
        contentView.addSubview(companyLabel)
        
        productivityLabel = UILabel()
        productivityLabel.translatesAutoresizingMaskIntoConstraints = false
        productivityLabel.font = UIFont.systemFont(ofSize: 35, weight: .regular)
        productivityLabel.textColor = .white
        productivityLabel.textAlignment = .right
        contentView.addSubview(productivityLabel)
        
        briefDescription = UITextView()
        briefDescription.isEditable = false
        briefDescription.isScrollEnabled = false
        briefDescription.translatesAutoresizingMaskIntoConstraints = false
        briefDescription.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        briefDescription.textColor = .white
        briefDescription.backgroundColor = contentView.backgroundColor
        briefDescription.textAlignment = .left
        contentView.addSubview(briefDescription)
        
//        topView = UIView()
//        topView.translatesAutoresizingMaskIntoConstraints = false
//        topView.backgroundColor = Colors.main
//        contentView.addSubview(topView)
        
//        bottomView = UIView()
//        bottomView.translatesAutoresizingMaskIntoConstraints = false
//        bottomView.backgroundColor = .white
//        contentView.addSubview(bottomView)
        
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
//            companyLabel.leadingAnchor.constraint(equalTo: topView.centerXAnchor, constant: Constants.viewPadding/2),
//            companyLabel.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -1*Constants.viewPadding/2)
            ])
        
        NSLayoutConstraint.activate([
            productivityLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 5),
            productivityLabel.bottomAnchor.constraint(equalTo: contentView.centerYAnchor),
            productivityLabel.trailingAnchor.constraint(equalTo: companyLabel.trailingAnchor, constant: -1*Constants.viewPadding/2),
            productivityLabel.leadingAnchor.constraint(equalTo: companyLabel.leadingAnchor)
            ])
        
        NSLayoutConstraint.activate([
            briefDescription.topAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 2*Constants.viewPadding),
            briefDescription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            briefDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            briefDescription.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -1*Constants.viewPadding)
            ])
        
    }
    
    func configure(for log: Log) {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        
        dateLabel.text = formatter.string(from: log.date)
        companyLabel.text = log.company
        
        productivityLabel.text = ""
        for x in 1...log.rating {
            productivityLabel.text = productivityLabel.text! + "\u{2B51}"
        }
        
        briefDescription.text = log.description
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
