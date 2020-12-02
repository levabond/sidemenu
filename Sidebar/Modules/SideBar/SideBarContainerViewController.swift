//
//  SideBarContainerViewController.swift
//  Sidebar
//
//  Created by Лев Бондаренко on 02.12.2020.
//

import UIKit

protocol SideBarDelegate: class {
    func changeSideBarOn(item: SideBarItem)
}

class SideBarContainerViewController: UIViewController {
    private var selectItem: SideBarItem?
    
    private var rootController: UIViewController!
    private lazy var sideMenuView = SideMenuView(
        frame: CGRect(x: 0, y: 0, width: 0, height: self.view.frame.height)
    )
    
    private lazy var blackScreenView: UIView = {
        let view = UIView(frame: self.view.frame)
        view.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        view.isHidden = true
        view.layer.zPosition = 1
        let tapGestRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(blackScreenTapAction(sender:))
        )
        view.addGestureRecognizer(tapGestRecognizer)
        
        return view
    }()
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMenuViewController()
        
        changeSideBarOn(item: .home)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .bookmarks,
            target: self,
            action: #selector(showSideMenuAction)
        )
    }
    
    // MARK: Sidebar Actions
    
    private func setupMenuViewController() {
        [blackScreenView,
         sideMenuView].forEach { navigationController?.view.addSubview($0) }
        
        sideMenuView.layer.zPosition = 2
        sideMenuView.sideBarDelegate = self
    }
    
    private func toggleMenu(_ value: Bool) {
        let width = value ? self.rootController.view.frame.width - 140 : 0
        UIView.animate(withDuration: 0.3) {
            self.sideMenuView.frame = CGRect(
                x: 0,
                y: 0,
                width: width,
                height: self.sideMenuView.frame.height
            )
            self.sideMenuView.layoutIfNeeded()
        }
    }
    
    private func hideBlackScreen() {
        blackScreenView.isHidden = true
        blackScreenView.frame = view.bounds
    }
    
    // MARK: Actions
    
    @objc func showSideMenuAction() {
        blackScreenView.isHidden = false
        toggleMenu(true)
    }
    
    @objc func blackScreenTapAction(sender: UITapGestureRecognizer) {
        guard let selectItem = self.selectItem else { return }
        hideBlackScreen()
        toggleMenu(false)
        changeSideBarOn(item: selectItem)
    }
}

extension SideBarContainerViewController: SideBarDelegate {
    func changeSideBarOn(item: SideBarItem) {
        if selectItem != item {
            selectItem = item
            
            let module = item.module
            module.delegate = self
            title = item.title
            rootController = module
            
            view.addSubview(rootController.view)
            addChild(rootController)
            
            toggleMenu(false)
            hideBlackScreen()
        }
    }
}
