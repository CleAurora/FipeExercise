//
//  CarModelsViewController.swift
//  FipeCars
//
//  Created by Cleís Aurora Pereira on 07/12/20.
//

import UIKit
import PKHUD

final class CarModelsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!

    var brand: Brand?

    private lazy var viewModel = CarModelsViewModel(with: brand)

    override func viewDidLoad() {
        super.viewDidLoad()

        title = brand?.name
        fetch()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.models.models.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ModelTableViewCell", for: indexPath)
        cell.textLabel?.text = viewModel.models.models[indexPath.row].name

        return cell
    }

    private func fetch() {
        HUD.show(.progress)

        viewModel.load { [weak self] in
            self?.showResult()
        }
    }

    private func showResult() {
        HUD.hide()

        if let error = viewModel.error {
            HUD.flash(
                .labeledError(title: "Falha ao carregar modelos", subtitle: error.localizedDescription),
                delay: 5
            )
        } else {
            HUD.flash(.success, delay: 1)

            tableView.reloadData()
        }
    }
}

