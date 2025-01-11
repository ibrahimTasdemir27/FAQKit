
# ViewStyleOptions
<img alt="Static Badge" src="https://img.shields.io/badge/Xcode-UIView-xcode?&logo=xcode&color=CF212E"> <a href='https://github.com/ibrahimTasdemir27/FAQKit/' target="_blank"><img alt="Static Badge" src="https://img.shields.io/badge/iOS-swift-xcode?logo=swift">
<a href='https://www.linkedin.com/in/ibrahim-halil-taşdemir-ios-developer-111631245/' target="_blank"><img alt="Static Badge" src="https://img.shields.io/badge/-0B66C2?logo=linkedin">
<a href='https://github.com/ibrahimTasdemir27/' target="_blank"><img alt="Static Badge" src="https://img.shields.io/badge/ibrahimtasdmr27-FAQKit-xcode?logo=GitHub&color=CF212E">

- FAQView

## Requirements
- iOS 14.0
- Xcode 15.0+
- Swift 5.10+



## Swift Package Manager

To integrate FAQKit into your Xcode project using Swift Package Manager, add it to the dependencies value of your Package.swift


```
dependencies: [
    .package(url: "https://github.com/ibrahimTasdemir27/FAQKit", .upToNextMajor(from: "1.1.0"))
]
```



## Usage
```swift
import FAQKit

    private let faqView = FaqView(faqs: [
        .init(
            title: "Faq1",
            description: "Faq Des1"
        ),
        .init(
            title: "Faq2",
            description: "Faq Des2"
        ),
        .init(
            title: "Faq3",
            description: "Faq Des3"
        ),
    ])

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(faqView)
        faqView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
```







