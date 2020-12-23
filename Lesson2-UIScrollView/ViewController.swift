//
//  ViewController.swift
//  Lesson2-UIScrollView
//
//  Created by admin on 12/22/20.
//

import UIKit

class ViewController: UIViewController {

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureScrollView()
        configureContent()
    }

    private func configureScrollView() {
        scrollView.contentSize = CGSize(width: view.frame.width * 3, height: view.frame.height)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
        ])
    }

    private func configureContent() {
        let firstView = UIView()
        firstView.backgroundColor = #colorLiteral(red: 1, green: 0.7188832164, blue: 0.7842692733, alpha: 1)
        firstView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.addSubview(firstView)

        let secondView = UIView()
        secondView.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        secondView.frame = CGRect(x: view.frame.width, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.addSubview(secondView)

        let thirdView = UIView()
        thirdView.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        thirdView.frame = CGRect(x: 2 * view.frame.width, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.addSubview(thirdView)
    }
}

