//
//  ViewController.swift
//  mvvm-c-pattern-blog-app
//
//  Created by TanjilaNur-00115 on 3/12/24.
//

import UIKit
import Combine

class ContactsViewController: UIViewController {
    
    var viewModel: ContactsViewModel
    
    var coordinator: ContactListCoordinator?
    
    private var tableView: UITableView!
    private var cancellables = Set<AnyCancellable>()
    
    init(viewModel: ContactsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Contacts"
        
        setupTableView()
        bindViewModel()
        
        // Trigger data fetch from ViewModel
        viewModel.fetchContacts()
    }

    private func setupTableView() {
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ContactsCell")
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    private func bindViewModel() {
        // Bind users to tableView
        viewModel.contacts.publisher
            .sink { [weak self] _ in
                self?.tableView.reloadData()
            }
            .store(in: &cancellables)
    }

    func didSelectContact(_ user: Contact) {
        coordinator?.didSelectContact(user)
    }
}

// MARK: - UITableViewDataSource
extension ContactsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.contacts.value.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let contact = viewModel.contacts.value[indexPath.row]
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "ContactsCell")
        
        cell.textLabel?.text = contact.name
        cell.detailTextLabel?.text = contact.contact
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ContactsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = viewModel.contacts.value[indexPath.row]
        didSelectContact(user)
    }
}
