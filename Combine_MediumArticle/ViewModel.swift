import Foundation
import Combine

enum SubmissionState {
    case success
    case error
}

class ViewModel {

    typealias Success = Bool
    let submitionStateSubject = CurrentValueSubject<SubmissionState?, Never>(nil)

    var submitionStatePublisher: AnyPublisher<SubmissionState, Never> {
        submitionStateSubject.compactMap{ $0 }.eraseToAnyPublisher()
    }

    func userDidTapSubmitButton() {
        submitToNetwork()
    }

    private func submitToNetwork() {
        //Code to do a network call and submit stuff here

        submitionStateSubject.send(.success)
    }
//    let submitionState: CurrentValueSubject<Success?, Never> = .init(nil)

//    typealias Success = Bool
//    func userDidTapSubmitButton(completion: (Success) -> Void) {
//        submitToNetwork(completion: completion)
//    }
//
//    private func submitToNetwork(completion: (Success) -> Void) {
//        //Code to do a network call and submit stuff here
//        completion(true)
//    }
}
