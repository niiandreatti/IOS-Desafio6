
import Foundation

protocol PresenterLogic {
    func presenterHelloWorld()
}

class Presenter: PresenterLogic {
    var vc: ViewControllerLogic?
    
    func presenterHelloWorld() {
        vc?.displayHelloWorld()
    }
}
