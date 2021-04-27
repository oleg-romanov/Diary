//
//  DatesView.swift
//  Diary
//
//  Created by Олег Романов on 4/25/21.
//

import UIKit

class DatesView: UIView, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    var collectionView: UICollectionView!
    var delegate: DatesViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupInitialState()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupInitialState()
    }
    
    func setupInitialState() {
        
        self.translatesAutoresizingMaskIntoConstraints = true
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: self.frame.height - 10, height: self.frame.height)
        layout.scrollDirection = .horizontal
        
        self.collectionView = UICollectionView(frame: self.frame, collectionViewLayout: layout)
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.collectionView.showsVerticalScrollIndicator = true
        self.collectionView.backgroundColor = .white
        self.collectionView.allowsSelection = true
        
        self.addSubview(collectionView)
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.collectionView.register(DatesViewCell.self, forCellWithReuseIdentifier: "DatesViewCell")
        
        self.collectionView.reloadData()
        
        self.updateConstraints()
    }
    
    func setSelected(date: Date) {
        let gregorianCalendar = Calendar.current
        var daysFromToday = gregorianCalendar.dateComponents([.day], from: Date(), to: date).day ?? 0
        
        if !gregorianCalendar.isDateInToday(date) {
            daysFromToday += 1
        }
        
        let indexPath = IndexPath(row: daysFromToday, section: 0)
        
        self.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        self.collectionView(self.collectionView, didSelectItemAt: indexPath)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DatesViewCell", for: indexPath) as! DatesViewCell
        
        cell.date = Date() + TimeInterval(indexPath.row * 24 * 60 * 60)
        cell.isToday = indexPath.row == 0
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.bounds.height - 10, height: self.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.dateSelected(date: Date() + TimeInterval(indexPath.row * 24 * 60 * 60))
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        self.removeConstraints(self.constraints)
        
//        self.collectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.collectionView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.collectionView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        self.collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.collectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
    }
}
