//
//  FaqView+LayoutMaker.swift
//  FAQKit
//
//  Created by İbrahim Taşdemir on 18.10.2024.
//

import UIKit

extension FaqView {
    struct LayoutMaker {
        func makeLayout() -> UICollectionViewCompositionalLayout {
            let configuration = UICollectionViewCompositionalLayoutConfiguration()
            return UICollectionViewCompositionalLayout.init(sectionProvider: { sectionIndex, _ in
                let section = NSCollectionLayoutSection.fillWidth(heightDimension: .estimated(300))
                section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 8, bottom: 10, trailing: 8)
                section.interGroupSpacing = 10
                return section
            }, configuration: configuration)
        }
    }
}
