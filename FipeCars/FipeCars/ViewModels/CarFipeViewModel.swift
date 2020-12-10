//
//  CarFipeViewModel.swift
//  FipeCars
//
//  Created by Cleís Aurora Pereira on 09/12/20.
//

final class CarFipeViewModel {
    private let brand: Brand?
    private let model: Model?
    private let year: Year?
    private let service: FipeService

    private(set) var fipe: Fipe? = nil
    private(set) var error: Error? = nil

    init(for brand: Brand?, with model: Model?, on year: Year?, service: FipeService = AlamofireFipeService.shared) {
        assert(brand != nil && model != nil && year != nil)

        self.brand = brand
        self.model = model
        self.year = year
        self.service = service
    }

    func load(then handler: @escaping () -> ()) {
        error = nil

        if let brand = brand, let model = model, let year = year {
            service.getFipe(from: brand, with: model, on: year) { result in
                do {
                    let fipe = try result.get()

                    self.fipe = fipe
                } catch {
                    self.error = error
                }

                handler()
            }
        }
    }
}
