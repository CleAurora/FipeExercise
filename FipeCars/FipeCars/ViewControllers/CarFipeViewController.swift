//
//  CarFipeViewController.swift
//  FipeCars
//
//  Created by Cleís Aurora Pereira on 09/12/20.
//

import UIKit
import PKHUD

final class CarFipeViewController: UIViewController {
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var fuelLabel: UILabel!
    @IBOutlet weak var fipeCodeLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var vehicleLabel: UILabel!
    @IBOutlet weak var fuelTypeLabel: UILabel!

    var brand: Brand?
    var model: Model?
    var year: Year?

    private lazy var viewModel = CarFipeViewModel(for: brand, with: model, on: year)

    override func viewDidLoad() {
        super.viewDidLoad()

        title = year?.name
        fetch()
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
                .labeledError(title: "Falha ao carregar os dados do FIPE", subtitle: error.localizedDescription),
                delay: 5
            )
        } else if let fipe = viewModel.fipe {
            HUD.flash(.success, delay: 1)

            valueLabel.text = fipe.value
            brandLabel.text = fipe.brand
            modelLabel.text = fipe.model
            yearLabel.text = "\(fipe.year)"
            fuelLabel.text = fipe.fuel
            fipeCodeLabel.text = fipe.fipeCode
            monthLabel.text = fipe.month
            vehicleLabel.text = "\(fipe.vehicleType)"
            fuelTypeLabel.text = fipe.fuelType
        }
    }
}
