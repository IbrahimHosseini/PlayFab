//
//  LeaderBoard+Network.swift
//  pixuneSampleApp
//
//  Created by Ebrahim Hosseini on 2/27/21.
//

import Foundation
import Combine

extension EndPoint {
    static private let leaderBoard = "GetLeaderboard"
    
    static func getLeaderBoard(maxResultCount: Int, startPosition: Int, staticName: String) -> Self {
        return EndPoint(path: leaderBoard,
                        basePath: server)
    }
}

//MARK: - Logic Controller
protocol LeaderBoardServiceProtocol: ServiceProtocol {
    func getLeaderBoard(maxResultCount: Int, startPosition: Int, staticName: String) -> AnyPublisher<LeaderBoardBaseModel, Error>
}

final class LeaderBoardService: LeaderBoardServiceProtocol {
    let networkController: NetworkControllerProtocol
    
    init(networkController: NetworkControllerProtocol) {
        self.networkController = networkController
    }
    
    func getLeaderBoard(maxResultCount: Int, startPosition: Int, staticName: String) -> AnyPublisher<LeaderBoardBaseModel, Error> {
        let endpoint = EndPoint.getLeaderBoard(maxResultCount: maxResultCount, startPosition: startPosition, staticName: staticName)
        
        let body: [String: Any] = ["MaxResultsCount": maxResultCount,
                                   "StartPosition": startPosition,
                                   "StatisticName": staticName]
        
        return networkController.post(type: LeaderBoardBaseModel.self,
                                      url: endpoint.url,
                                      body: body,
                                      headers: endpoint.headers)
    }
}

