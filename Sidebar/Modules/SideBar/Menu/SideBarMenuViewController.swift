//
//  SideBarMenuViewController.swift
//  Sidebar
//
//  Created by Лев Бондаренко on 02.12.2020.
//

import UIKit

final class SideMenuView: UIView {
    
    weak var sideBarDelegate: SideBarDelegate?
    
    private let tableView = UITableView()
    private let items: [SideBarItem] = SideBarFactory.makeSideBarItems()
    private let cellIDs: String = "SideBarCellID"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .gray
        
        addSubview(tableView)
        
        tableView.backgroundColor = .gray
        tableView.separatorColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.bounces = false
        tableView.register(SideMenuCell.self, forCellReuseIdentifier: cellIDs)
        tableView.tableFooterView = UIView(frame: .zero)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        tableView.topAnchor.constraint(equalTo: topAnchor, constant: 50).isActive = true
        tableView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}

// MARK: - UITableViewDataSource

extension SideMenuView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIDs, for: indexPath)
        cell.textLabel?.text = items[indexPath.item].title
        cell.textLabel?.textColor = .white
        cell.backgroundColor = .gray
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension SideMenuView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        sideBarDelegate?.changeSideBarOn(item: items[indexPath.item])
    }
}

