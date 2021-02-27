//
//  LeaderBoardVC.swift
//  pixuneSampleApp
//
//  Created by Ebrahim Hosseini on 2/27/21.
//

import UIKit
import Combine

class LeaderBoardVC: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    //MARK: - Properties
    private var viewModel = LeaderBoardViewModel()
    private var subscribers = Set<AnyCancellable>()
    
    
    //MARK: - View cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTable()
        setupBinding()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getLeaderBoard(maxResultCount: 10,
                                 startPosition: 0,
                                 staticName: "leaderBoard")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //MARK: - Functions
    fileprivate func setupView() {
        title = "LeaderBoard"
        indicator.startAnimating()
        indicator.color = .systemTeal
        indicator.hidesWhenStopped = true
        indicator.style = .large
    }
    
    fileprivate func setupBinding() {
        viewModel.$leaderBoardCellViewModel
            .receive(on: RunLoop.main)
            .sink { data in
                if let data = data, data.count > 0 {
                    self.indicator.stopAnimating()
                    self.tableView.reloadData()
                }
            }
            .store(in: &subscribers)
    }
    
}

//MARK: - table view
extension LeaderBoardVC: UITableViewDelegate, UITableViewDataSource {
    
    func setupTable() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        
        tableView.register(LeaderBoardTableViewCell.self)
        
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = true
        tableView.showsHorizontalScrollIndicator = false
        tableView.separatorInset.left = 16
        tableView.separatorInset.right = 16
        tableView.separatorStyle = .singleLine
        tableView.allowsSelection = false
        tableView.tableFooterView = UIView()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.leaderBoardCellViewModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeue(LeaderBoardTableViewCell.self)
        if let data = viewModel.leaderBoardCellViewModel?[indexPath.row] {
            cell.viewModel = data
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
