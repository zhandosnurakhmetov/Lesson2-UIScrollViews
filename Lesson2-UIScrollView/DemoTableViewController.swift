//
//  DemoTableViewController.swift
//  Lesson2-UIScrollView
//
//  Created by admin on 12/22/20.
//

import UIKit

class DemoTableViewController: UIViewController {

    private let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(DemoTableViewCell.self, forCellReuseIdentifier: "identifier")
        tableView.register(DemoTableViewCell2.self, forCellReuseIdentifier: "identifier2")
    }

    private func configureTableView() {
        let headerView = UIView()
        headerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 100)
        headerView.backgroundColor = .red
        tableView.tableHeaderView = headerView

        let footerView = UIView()
        footerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 100)
        footerView.backgroundColor = .blue
        tableView.tableFooterView = footerView

        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension DemoTableViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 10
        }
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "identifier", for: indexPath) as? DemoTableViewCell else { return UITableViewCell() }
            if indexPath.row == 0 {
                cell.titleLabel.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
            } else {
                cell.titleLabel.text = "Section: \(indexPath.section) row: \(indexPath.row)"
            }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "identifier2",
                for: indexPath
            ) as? DemoTableViewCell2 else { return UITableViewCell() }
            cell.titleLabel.text = "Section: \(indexPath.section) row: \(indexPath.row)"
            return cell
        }
    }
}

extension DemoTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = FirstSectionHeaderView()
        return view
    }
}
