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
        logsFlowLayout.minimumLineSpacing = Constants.viewPadding
        logsFlowLayout.minimumInteritemSpacing = Constants.viewPadding
        
        logsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: logsFlowLayout)
        logsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        logsCollectionView.backgroundColor = Colors.lightGray
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
            logsCollectionView.topAnchor.constraint(equalTo: logsLabel.bottomAnchor, constant: Constants.viewPadding),
            logsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.viewPadding),
            logsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -1 * Constants.viewPadding),
            logsCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -1 * Constants.viewPadding)
            ])
    }
    
    func hardCodeData() {
        let log1 = Log(date: Date(), company: "company1", rating: 1, description: "d1")
        let log2 = Log(date: Date(), company: "company2", rating: 1, description: "d2")
        
        originalLogs = [log1, log2]
        displayLogs = [log1, log2]
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
