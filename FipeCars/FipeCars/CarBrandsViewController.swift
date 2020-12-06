//
//  CarBrandsViewController.swift
//  FipeCars
//
//  Created by Cleís Aurora Pereira on 30/11/20.
//

import UIKit
import PKHUD

final class CarBrandsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!

    private let viewModel = CarBrandsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        fetch()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.brands.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "BrandTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.textLabel?.text = viewModel.brands[indexPath.row].name

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
            HUD.show(
                .labeledError(title: "Falha ao carregar", subtitle: error.localizedDescription)
            )
        } else {
            HUD.flash(.success, delay: 1)

            tableView.reloadData()
        }
    }
}

