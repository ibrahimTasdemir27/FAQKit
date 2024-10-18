//
//  FaqCell.swift
//  FAQKit
//
//  Created by İbrahim Taşdemir on 18.10.2024.
//

import UIKit
import ViewStyleOptions
import SnapKit

public class FaqCell: UICollectionViewCell {
      
    public class Args {
        let title: String
        let description: String
        var isOpened: Bool
        let titleStackViewStyles: [ViewStyleOptions]
        let titleLabelSpecialStyles: [LabelViewStyleOptions]
        let descriptionSpecialStyles: [TextViewStyleOptions]
        
        public init(title: String, description: String, isOpened: Bool = false,
             titleStackViewStyles: [ViewStyleOptions] = [],
             titleLabelSpecialStyles: [LabelViewStyleOptions] = [],
             descriptionSpecialStyles: [TextViewStyleOptions] = []) {
            self.title = title
            self.description = description
            self.isOpened = isOpened
            self.titleStackViewStyles = titleStackViewStyles
            self.titleLabelSpecialStyles = titleLabelSpecialStyles
            self.descriptionSpecialStyles = descriptionSpecialStyles
        }
         
        
    } 
    
    let stackView = UIStackView()
    let titleView = UIView(configs: .setRadius(12), .setBackground(.systemGray5))
    let titleButton = UILabel(special: .setTextColor(.black), .setAligment(.left), .set0Line, .setFont(.systemFont(ofSize: 15, weight: .semibold)))
    let descriptionContent = UIView()
    let descriptionTextView = UITextView(special: .setEditable(false), .setFont(.systemFont(ofSize: 15)))
    let chevron = UIButton(special: .setImage(UIImage(systemName: "chevron.right")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 14, weight: .medium))))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInıt()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInıt()
    }
    
    private func commonInıt() {
        configureUI()
        setupConstraints(addSubview(_:))
    }
    
    
    func configure(for args: Args) {
        titleView.applyStyles(args.titleStackViewStyles)
        titleButton.text = args.title.localized
        titleButton.applyStyles(args.titleLabelSpecialStyles)
        descriptionTextView.text = args.description.localized
        descriptionContent.isHidden = !args.isOpened
        let chevronImage: UIImage? = args.isOpened ? .init(systemName: "chevron.down") : .init(systemName: "chevron.right")
        chevron.setImage(chevronImage, for: .normal)
    }
    
      
}

private extension FaqCell {
    func configureUI() {
        stackView.spacing = 10
        stackView.axis = .vertical
        chevron.tintColor = .darkGray
        descriptionTextView.isSelectable = true
        descriptionTextView.showsVerticalScrollIndicator = false
    }
    
    func setupConstraints(_ subviews: (UIView) -> Void) {
        subviews(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    
        titleView.applyStyles(.addSubviews([titleButton, chevron]))
        titleButton.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview().inset(5)
            make.leading.equalToSuperview().inset(10)
            make.trailing.equalTo(chevron.snp.leading).offset(-10)
            make.height.greaterThanOrEqualTo(35)
        }
        chevron.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-10)
            make.size.equalTo(30)
        }
        
        descriptionContent.addSubview(descriptionTextView)
        descriptionTextView.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(10)
        }
        
        [titleView, descriptionContent].forEach({ stackView.addArrangedSubview($0) })
    }
    
}

