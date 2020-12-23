//
//  ScrollViewWithStackViewController.swift
//  Lesson2-UIScrollView
//
//  Created by admin on 12/22/20.
//

import UIKit
import SnapKit

class ScrollViewWithStackViewController: UIViewController {

    private let scrollView = UIScrollView()

    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureScrollView()
        configureStackView()
        configureStackViewContent()
    }

    private func configureScrollView() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }

    private func configureStackView() {
        scrollView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    private func configureStackViewContent() {
        for i in 0..<30 {
            let label = UILabel()
            label.text = "Label \(i)"
            stackView.addArrangedSubview(label)
        }
    }
}
