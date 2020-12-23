//
//  FirstSectionHeaderView.swift
//  Lesson2-UIScrollView
//
//  Created by admin on 12/22/20.
//

import SnapKit

final class FirstSectionHeaderView: UIView {
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Section header button", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(button)
        button.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(44)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
