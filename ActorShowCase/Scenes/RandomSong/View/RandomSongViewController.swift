//
//  RandomSongViewController.swift
//  ActorShowCase
//
//  Created by Ruttanachai Auitragool on 14/7/22.
//

import UIKit

class RandomSongViewController: UIViewController {
    // MARK: - Outlets

    @IBOutlet var firstButton: UIButton!
    @IBOutlet var firstResultLabel: UILabel!
    @IBOutlet var secondButton: UIButton!
    @IBOutlet var secondResultLabel: UILabel!

    // MARK: - Variables

    private lazy var viewModel: RandomSongViewModel = {
        let apiService = RandomSongAPIService()

        // 1. Cache with the dictionary
        apiService.cache = GlobalVar.shared.cache

        // 2. Cache with the thread-safe dictionary
        // apiService.cache = GlobalVar.shared.cacheThreadSafe

        // 3. Cache with the actor
        // apiService.actorCache = GlobalVar.shared.actorCache

        return RandomSongViewModel(apiService: apiService)
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupViewModel()
    }

    func setupView() {
        title = "Random Song"
    }

    func setupViewModel() {
        viewModel.onError = { apiError in
            print(apiError.message ?? "")
        }

        viewModel.onLoadData = { [weak self] origin, results in
            DispatchQueue.main.async {
                guard let self = self else { return }

                if results.count > 0 {
                    switch origin {
                    case .first:
                        self.firstResultLabel.text = results.randomElement()?.trackName
                    case .second:
                        self.secondResultLabel.text = results.randomElement()?.trackName
                    }
                }
            }
        }
    }

    @IBAction func firstButtonAction(_ sender: UIButton) {
        viewModel.loadData(origin: .first, artistName: "Taylor Swift")
        // viewModel.loadDataWithActorCache(origin: .first, artistName: "Taylor Swift")
    }

    @IBAction func secondButtonAction(_ sender: UIButton) {
        viewModel.loadData(origin: .second, artistName: "Maroon 5")
        // viewModel.loadDataWithActorCache(origin: .second, artistName: "Maroon 5")
    }
}
