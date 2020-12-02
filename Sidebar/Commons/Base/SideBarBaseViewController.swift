//
//  BaseViewController.swift
//  Sidebar
//
//  Created by Лев Бондаренко on 02.12.2020.
//

import UIKit

class SideBarBaseViewController: UIViewController {
    
    weak var delegate: SideBarDelegate?
    // MARK: Lifcycle
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
        
        setupViews()
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStrings()
    }
    
    // MARK: Setup Functions
    
    func setupStrings() {}
    
    func setupViews() {}
    
    func setupLayout() {}
}
