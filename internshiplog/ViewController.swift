//
//  ViewController.swift
//  internshiplog
//
//  Created by Michael Behrens on 5/6/19.
//  Copyright © 2019 Michael Behrens. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var logsLabel: UILabel!
    let logReuse = "logreuse"
    let filterReuse = "filterreuse"
    var originalLogs: [Log]!
    var displayLogs: [Log]!
    var filters: [String]!
    var appliedFilters: [String] = []
    var logsCollectionView: UICollectionView!
    var logsFlowLayout: UICollectionViewFlowLayout!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        title = "Home"
        self.navigationController!.navigationBar.barTintColor = Colors.main
        self.navigationController!.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.white,
             NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .bold)]
        
        logsLabel = UILabel()
        logsLabel.translatesAutoresizingMaskIntoConstraints = false
        logsLabel.textColor = Colors.main
        logsLabel.text = "Logs"
        logsLabel.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        view.addSubview(logsLabel)
        
        logsFlowLayout = UICollectionViewFlowLayout()
        logsFlowLayout.scrollDirection = .vertical
        logsFlowLayout.minimumLineSpacing = Constants.spacing
        logsFlowLayout.minimumInteritemSpacing = Constants.spacing
        
        logsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: logsFlowLayout)
        logsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        logsCollectionView.backgroundColor = .white
        logsCollectionView.dataSource = self
        logsCollectionView.delegate = self
        logsCollectionView.register(LogCollectionViewCell.self, forCellWithReuseIdentifier: logReuse)
        view.addSubview(logsCollectionView)
        
        setupConstraints()
        hardCodeData()
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            logsLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.viewPadding),
            logsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.viewPadding),
            logsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -1 * Constants.viewPadding),
            logsLabel.heightAnchor.constraint(equalToConstant: 45)
            ])
        
        NSLayoutConstraint.activate([
            logsCollectionView.topAnchor.constraint(equalTo: logsLabel.bottomAnchor, constant: 2*Constants.viewPadding),
            logsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.viewPadding),
            logsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -1 * Constants.viewPadding),
            logsCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -1 * Constants.viewPadding)
            ])
    }
    
    func hardCodeData() {
        let log1 = Log(date: Date(), company: "company1", rating: 1, description: "d1d1d1d1d1d1d1d1d1d1d1d1d1d1d1d1")
        let log2 = Log(date: Date(), company: "company2", rating: 1, description: "d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2")
        let log3 = Log(date: Date(), company: "company2", rating: 2, description: "d3")
        let log4 = Log(date: Date(), company: "company2", rating: 3, description: "d3")
        let log5 = Log(date: Date(), company: "company2", rating: 4, description: "d3")
        let log6 = Log(date: Date(), company: "company2", rating: 5, description: "d3")
        
        originalLogs = [log1, log2, log3, log4, log5, log6]
        displayLogs = [log1, log2, log3, log4, log5, log6]
    }


}



extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return displayLogs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: logReuse, for: indexPath) as! LogCollectionViewCell
        let log = displayLogs[indexPath.item]
        cell.configure(for: log)
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let length = collectionView.frame.width - Constants.viewPadding*2
        return CGSize(width: length, height: length/2.0)
    }
}
