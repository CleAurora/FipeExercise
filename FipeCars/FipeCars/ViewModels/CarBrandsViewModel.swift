//
//  CarBrandsViewModel.swift
//  FipeCars
//
//  Created by Cleís Aurora Pereira on 06/12/20.
//

final class CarBrandsViewModel {
    private let service: FipeService

    private (set) var brands = [Brand]()
    private (set) var error: Error? = nil

    init(service: FipeService = AlamofireFipeService.shared) {
        self.service = service
    }

    func load(then handler: @escaping () -> ()) {
        error = nil

        service.getBrands { result in
            do {
                let brands = try result.get()

                self.brands = brands
            } catch {
                self.error = error
            }

            handler()
        }
    }
}
