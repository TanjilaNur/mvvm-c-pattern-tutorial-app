//
//  UsersViewModel.swift
//  mvvm-c-pattern-blog-app
//
//  Created by TanjilaNur-00115 on 3/12/24.
//

import Combine
import UIKit

class ContactsViewModel {
    private var cancellables = Set<AnyCancellable>()
    
    var contacts: Observable<[Contact]> = Observable([])
    
    func fetchContacts() {
        // Simulating a network call with Combine and a delay
        Just([
            Contact(name: "John Doe", contact: "+1-212-456-7890"),
            Contact(name: "Jane Smith", contact: "+1-312-456-7090"),
            Contact(name: "Samuel Adams", contact: "+1-302-456-7830"),
            Contact(name: "Rita Gomez", contact: "+1-212-116-1110"),
            Contact(name: "Alina lily", contact: "+1-212-006-4420"),
            Contact(name: "Saif Adams", contact: "+1-212-996-1110"),
            Contact(name: "Nick Doe", contact: "+1-212-786-8880"),
            Contact(name: "A k Jane", contact: "+1-212-236-1110"),
            Contact(name: "Jack Smith", contact: "+1-212-116-8880")
        ])
        .delay(for: .seconds(1), scheduler: DispatchQueue.main) // Simulate delay
        .sink { [weak self] users in
            self?.contacts.value = users
        }
        .store(in: &cancellables)
    }
}

