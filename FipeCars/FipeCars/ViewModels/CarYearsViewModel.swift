//
//  CarYearsViewModel.swift
//  FipeCars
//
//  Created by Cleís Aurora Pereira on 09/12/20.
//

final class CarYearsViewModel {
    private let brand: Brand?
    private let model: Model?
    private let service: YearsService

    private(set) var years = [Year]()
    private(set) var error: Error? = nil

    init(with brand: Brand?, on model: Model?, service: YearsService = AlamofireFipeService.shared) {
        assert(brand != nil && model != nil)

        self.brand = brand
        self.model = model
        self.service = service
    }

    func load(then handler: @escaping () -> ()) {
        error = nil

        if let brand = brand, let model = model {
            service.getYears(from: brand, with: model) { result in
                do {
                    let years = try result.get()

                    self.years = years
                } catch {
                    self.error = error
                }

                handler()
            }
        }
    }
}
