//
//  ViewController.swift
//  Combine_MediumArticle
//
//  Created by Miguel Vieira on 12/07/2020.
//

import UIKit
import Combine

class ViewController: UIViewController {

    let viewModel = ViewModel()
    let statusLabel = UILabel()
    private var subcriptions = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
//
//    @IBAction func submitButtonTapped(sender: UIButton) {
//        viewModel.userDidTapSubmitButton { success in
//            guard success else {
//                statusLabel.text = "There was an error!"
//                statusLabel.textColor = .red
//                return
//            }
//            statusLabel.text = "Submitted successfully"
//        }
//    }

    private func configureSubscriptions() {
        viewModel
            .submitionStatePublisher
            .sink { [weak self] state in
                switch state {
                    case .success:
                        self?.setSuccessState()
                    case .error:
                        self?.setSuccessState()
                }
            }
            .store(in: &subcriptions)
    }

    private func setSuccessState() {
        statusLabel.text = "Submitted successfully"
    }

    private func setErrorState() {
        statusLabel.text = "There was an error!"
        statusLabel.textColor = .red
    }

    @IBAction func submitButtonTapped(sender: UIButton) {
        viewModel.userDidTapSubmitButton()
    }
}
