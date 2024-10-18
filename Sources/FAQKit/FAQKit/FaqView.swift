//
//  FaqView.swift
//  FAQKit
//
//  Created by İbrahim Taşdemir on 18.10.2024.
//

import UIKit

public class FaqView: UIView {
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    private var faqs: [FaqCell.Args]!
    
    public convenience init(faqs: [FaqCell.Args]) {
        self.init(frame: .zero)
        self.faqs = faqs
        commonInıt()
    }
    
    private func commonInıt() {
        configureUI()
        configureCollectionView()
        setupConstraints(addSubview(_:))
        collectionView.reloadData()
    }
    
}


public extension FaqView: UICollectionViewDelegate & UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        faqs[indexPath.row].isOpened = !faqs[indexPath.row].isOpened
        collectionView.reloadItems(at: [indexPath])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        faqs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FaqCell", for: indexPath) as! FaqCell
        cell.configure(for: faqs[indexPath.row])
        return cell
    }
}


private extension FaqView {
    func configureUI() {
        
    }
    
    func configureCollectionView() {
        collectionView.register(FaqCell.self, forCellWithReuseIdentifier: "FaqCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.setCollectionViewLayout(LayoutMaker().makeLayout(), animated: false)
    }
    
    func setupConstraints(_ subviews: (UIView) -> Void) {
        subviews(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.greaterThanOrEqualTo(250)
        }
    }
    
}
