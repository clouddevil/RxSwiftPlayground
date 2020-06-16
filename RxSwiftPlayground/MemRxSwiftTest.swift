
import Foundation
import RxSwift


struct ListState {
    let val = 42
}

struct Summary {
    
}

class ConversationListViewModel {
    private let models = BehaviorSubject<Summary?>(value: nil)
    
    // ref to map self
    lazy var conversationListState = observableListState()
    
    func observableListState() -> Observable<ListState> {
        Observable.combineLatest([models]).map {_ in
            self.mapListState()
        }
    }
    
    private func mapListState() -> ListState {
        ListState()
    }
    
    
    init() {
        print("*** init ConversationListViewModel")
    }
    
    deinit {
        print("*** deinit ConversationListViewModel")
    }
}


