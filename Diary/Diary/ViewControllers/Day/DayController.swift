//
//  DayController.swift
//  Diary
//
//  Created by Олег Романов on 4/26/21.
//

import UIKit

class DayController: UIViewController {

    // MARK:- Properties

    @IBOutlet weak var daysView: DatesView!
    @IBOutlet var collectionView: UICollectionView!
    
    lazy var dataSource: DayDataSource = DayDataSource(collectionView: collectionView)

    private let service: EventService = EventServiceMock()

    override func viewDidLoad() {
        super.viewDidLoad()
        daysView.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = dataSource
        setupStyle()
    }

    private func setupStyle() {
        (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.sectionHeadersPinToVisibleBounds = true
        daysView.setSelected(date: Date())
        dateSelected(date: Date())
    }

    private func updateData(date: Date) {
        service.findByDay(date: date) { [weak self] result in
            switch result {
            case let .success(data):
                self?.dataSource.updateData(data.sorted(by: { $0.date < $1.date }))
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
}

extension DayController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        present(DetailedViewController(), animated: true, completion: nil)
        collectionView.deselectItem(at: indexPath, animated: true)
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width / 3, height: 100)
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        referenceSizeForHeaderInSection section: Int
    ) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 100)
    }
}

extension DayController: DatesViewDelegate {
    func dateSelected(date: Date?) {
        guard let date = date else { return }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yy"
        dateFormatter.locale = Locale(identifier: "Ru")
        title = dateFormatter.string(from: date)
        updateData(date: date)
    }
}
