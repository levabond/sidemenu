//
//  SideBarFactory.swift
//  Sidebar
//
//  Created by Лев Бондаренко on 02.12.2020.
//

import UIKit

enum SideBarItem {
    case home,
         about,
         info
    
    var title: String {
        switch self {
        case .home:
            return "Главная"
        case .about:
            return "О нас"
        case .info:
            return "Инфо"
        }
    }
    
    var module: SideBarBaseViewController {
        switch self {
        case .home:
            return HomeViewController()
        case .about:
            return AboutViewController()
        case .info:
            return InfoViewController()
        }
    }
}

final class SideBarFactory {
    static func makeSideBarItems() -> [SideBarItem] {
        return [
            .home,
            .about,
            .info
        ]
    }
}
