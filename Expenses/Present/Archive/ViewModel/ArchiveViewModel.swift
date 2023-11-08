//
//  ArchieveViewModel.swift
//  Expenses
//
//  Created by Zaur Askerov on 05.11.23.
//

import UIKit

class ArchiveViewModel {
    
    private let session: Session
    private let archieveRepository: DIArchieveRepesitory
    
    init(session: Session, repository: DIArchieveRepesitory) {
        self.session = session
        self.archieveRepository = repository
    }
    
    var getArchive: [ArchiveModel] {
        return session.getArchieve
    }
    
    func fetchData() {
        archieveRepository.readData { model in
            self.session.setArchieve = model
        }
    }
    
}
