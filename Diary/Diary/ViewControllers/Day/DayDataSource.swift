//
//  DayDataSource.swift
//  Diary
//
//  Created by Олег Романов on 4/26/21.
//

import UIKit

class DayDataSource: NSObject {
    typealias OneHourEvents = (key: Date, value: [Event])
    var data: [OneHourEvents] = []

    let collectionView: UICollectionView
    
    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
        collectionView.register(UINib(nibName: "CustomCell", bundle: .main), forCellWithReuseIdentifier: "Cell")
        collectionView.register(DaySectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: DaySectionHeader.identifier)
    }
    
    func updateData(_ data: [Event]) {
        let dictionary: [Date: [Event]] = Dictionary(grouping: data, by: { item in
            let timestamp = item.date.timeIntervalSince1970
            let roundedTimestamp = timestamp - timestamp.truncatingRemainder(dividingBy: 3600)
            return Date(timeIntervalSince1970: roundedTimestamp)
        })
        let sortedArray: [(key: Date, value: [Event])] = dictionary.sorted(by: { $0.key < $1.key })
        self.data = sortedArray
        collectionView.reloadData()
    }
}

extension DayDataSource: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        data.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data[section].value.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CustomCell else {
            fatalError("Can't dequeue cell")
        }
        let event = data[indexPath.section].value[indexPath.row]
        cell.configure(event: event)
        return cell
    }

    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: DaySectionHeader.identifier, for: indexPath) as? DaySectionHeader
            header?.configure(time: data[indexPath.section].key)
            return header ?? UICollectionReusableView()
        }
        return UICollectionReusableView()
    }
}
