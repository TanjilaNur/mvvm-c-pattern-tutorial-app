//
//  UserDetailViewController.swift
//  mvvm-c-pattern-blog-app
//
//  Created by TanjilaNur-00115 on 3/12/24.
//

import UIKit


class ContactDetailViewController: UIViewController {
    
    var contact: Contact
    
    init(contact: Contact) {
        self.contact = contact
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Contact Details"
        view.backgroundColor = .white
        setupViews()
    }
    
    private func setupViews() {
        // Create a stack view to hold the rows
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        // First Row: Person Icon + Name
        let personRow = createRow(iconName: "person.fill", text: contact.name, textColor: .darkGray)
        
        // Second Row: Phone Icon + Contact
        let phoneRow = createRow(iconName: "phone.fill", text: contact.contact, textColor: .blue)
        
        // Add rows to stack view
        stackView.addArrangedSubview(personRow)
        stackView.addArrangedSubview(phoneRow)
        
        // Add stack view to the main view
        view.addSubview(stackView)
        
        // Layout constraints for stack view
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func createRow(iconName: String, text: String, textColor: UIColor) -> UIView {
        // Create an icon image view
        let iconImageView = UIImageView()
        iconImageView.image = UIImage(systemName: iconName)
        iconImageView.tintColor = .darkGray
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        
        // Create a label for the text
        let label = UILabel()
        label.text = text
        label.textColor = textColor
        label.font = .systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        // Create a horizontal stack view for the row
        let rowStackView = UIStackView(arrangedSubviews: [iconImageView, label])
        rowStackView.axis = .horizontal
        rowStackView.spacing = 10
        rowStackView.alignment = .center
        rowStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Set a fixed width and height for the icon
        NSLayoutConstraint.activate([
            iconImageView.widthAnchor.constraint(equalToConstant: 24),
            iconImageView.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        return rowStackView
    }
}


