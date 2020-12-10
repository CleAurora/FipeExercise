//
//  CarYearsViewController.swift
//  FipeCars
//
//  Created by Cleís Aurora Pereira on 09/12/20.
//

import UIKit
import PKHUD

final class CarYearsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!

    var brand: Brand?
    var model: Model?

    private lazy var viewModel = CarYearsViewModel(with: brand, on: model)

    override func viewDidLoad() {
        super.viewDidLoad()

        title = model?.name
        fetch()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.years.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "YearTableViewCell", for: indexPath)
        cell.textLabel?.text = viewModel.years[indexPath.row].name

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
                .labeledError(title: "Falha ao carregar anos de carros", subtitle: error.localizedDescription),
                delay: 5
            )
        } else {
            HUD.flash(.success, delay: 1)

            tableView.reloadData()
        }
    }
}

