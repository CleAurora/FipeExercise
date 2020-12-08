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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)

        if let brand = sender as? Brand, let carModelsViewController = segue.destination as? CarModelsViewController {
            carModelsViewController.brand = brand
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let brand = viewModel.brands[indexPath.row]

        performSegue(withIdentifier: "ShowCarModelsSegue", sender: brand)
        tableView.deselectRow(at: indexPath, animated: true)
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
            HUD.flash(
                .labeledError(title: "Falha ao carregar marcas", subtitle: error.localizedDescription),
                delay: 5
            )
        } else {
            HUD.flash(.success, delay: 1)

            tableView.reloadData()
        }
    }
}

