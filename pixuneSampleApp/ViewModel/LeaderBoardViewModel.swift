//
//  LeaderBoardViewModel.swift
//  pixuneSampleApp
//
//  Created by Ebrahim Hosseini on 2/27/21.
//

import Foundation
import Combine

class LeaderBoardViewModel {
    @Published var leaderBoardCellViewModel: [LeaderBoardCellViewModel]? = []
    
    var leaderBoardService: LeaderBoardService
    private var subscribers = Set<AnyCancellable>()
    
    init() {
        let network = NetworkController()
        leaderBoardService = LeaderBoardService(networkController: network)
    }
    
    func getLeaderBoard(maxResultCount: Int, startPosition: Int, staticName: String) {
        leaderBoardService.getLeaderBoard(maxResultCount: maxResultCount, startPosition: startPosition, staticName: staticName)
            .print()
            .sink { (completion) in
                switch completion {
                case .failure(let error):
                    print(error.localizedDescription)
                case .finished:
                    print("Finished LeaderBoard")
                }
            } receiveValue: { [weak self] (leaderBoards) in
                guard let self = self else { return }
                
                self.leaderBoardCellViewModel = leaderBoards.data?.leaderboard
                    .map { (leaderBoards) -> [LeaderBoardCellViewModel] in
                        var leaderBoardCellViewModels: [LeaderBoardCellViewModel] = []
                        leaderBoards.forEach { (leaderBoard) in
                            leaderBoardCellViewModels.append(LeaderBoardCellViewModel(leaderBoard: leaderBoard))
                        }
                        return leaderBoardCellViewModels
                    }
            }
            .store(in: &subscribers)

    }
    
}


