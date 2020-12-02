//
//  SideMenuCell.swift
//  Sidebar
//
//  Created by Лев Бондаренко on 02.12.2020.
//

import UIKit

final class SideMenuCell: UITableViewCell {
    lazy var separatorView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: 1))
        view.backgroundColor = .gray
        
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        [separatorView].forEach { contentView.addSubview($0) }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
