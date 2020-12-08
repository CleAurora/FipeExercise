//
//  CarModelsViewModel.swift
//  FipeCars
//
//  Created by Cleís Aurora Pereira on 07/12/20.
//

final class CarModelsViewModel {
    private let brand: Brand?
    private let service: ModelsService

    private(set) var models = CarModel()
    private(set) var error: Error? = nil

    init(with brand: Brand?, service: ModelsService = AlamofireFipeService.shared) {
        assert(brand != nil)

        self.brand = brand
        self.service = service
    }

    func load(then handler: @escaping () -> ()) {
        error = nil
        if let brand = brand {
            service.getModels(from: brand) { result in
                do {
                    let models = try result.get()

                    self.models = models
                } catch {
                    self.error = error
                }

                handler()
            }
        }
    }
}
