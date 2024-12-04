//
//  UserListCoordinator.swift
//  mvvm-c-pattern-blog-app
//
//  Created by TanjilaNur-00115 on 3/12/24.
//

import UIKit

class ContactListCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    var children: [Coordinator]? = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = ContactsViewModel()
        let usersVC = ContactsViewController(viewModel: viewModel)
        usersVC.coordinator = self
        navigationController.pushViewController(usersVC, animated: true)
    }

    func didSelectContact(_ contact: Contact) {
        let userDetailsVC = ContactDetailViewController(contact: contact)
        navigationController.pushViewController(userDetailsVC, animated: true)
    }
}


