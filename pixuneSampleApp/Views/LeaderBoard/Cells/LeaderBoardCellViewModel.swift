//
//  LeaderBoardCellViewModel.swift
//  pixuneSampleApp
//
//  Created by Ebrahim Hosseini on 2/27/21.
//

import Foundation

class LeaderBoardCellViewModel {
    @Published var name: String = ""
    
    private var LeaderBoardModel: LeaderboardModel?
    
    init(leaderBoard: LeaderboardModel) {
        self.LeaderBoardModel = leaderBoard
        setupBinding()
    }
    
    fileprivate func setupBinding() {
        guard let leaderBoard = LeaderBoardModel else { return }
        
        self.name = leaderBoard.displayName ?? ""
    }
}
