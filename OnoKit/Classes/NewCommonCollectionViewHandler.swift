//
//  NewCommonCollectionViewHandler.swift
//  OnoKit
//
//  Created by Danny on 3/7/22.
//

import UIKit

open class NewCommonCollectionViewHandler: NSObject, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    private lazy var dataSource = makeDataSource()

    typealias DataSource = UICollectionViewDiffableDataSource<AnyHashable, AnyHashable>
    typealias Snapshot = NSDiffableDataSourceSnapshot<AnyHashable, AnyHashable>

    let collectionView: UICollectionView

    init(_ collectionView: UICollectionView) {
        self.collectionView = collectionView
        super.init()

        collectionView.delegate = self
    }

    open func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .zero
    }

    open func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }

    // needs overridden by subclass
    open func collectionViewHandler(cellForItemAt indexPath: IndexPath, itemIdentifier: AnyHashable) -> UICollectionViewCell? {
        return nil
    }

    open func collectionViewHandlerSections() -> [AnyHashable] {
        return []
    }

    open func collectionViewHandler(itemIdentifiersFor section: AnyHashable) -> [AnyHashable] {
        return []
    }

    private func makeDataSource() -> DataSource {
        let dataSource = DataSource(collectionView: collectionView) { _, indexPath, itemIdentifer in
            let cell = self.collectionViewHandler(cellForItemAt: indexPath, itemIdentifier: itemIdentifer)

            return cell
        }

        return dataSource
    }

    public func applySnapshot(animatingDifferences: Bool) {
        var snapshot = Snapshot()

        let sections = self.collectionViewHandlerSections()
        snapshot.appendSections(sections)

        for section in sections {
            let identifiers = self.collectionViewHandler(itemIdentifiersFor: section)
            snapshot.appendItems(identifiers, toSection: section)
        }

        dataSource.apply(snapshot, animatingDifferences: animatingDifferences)
    }
}
