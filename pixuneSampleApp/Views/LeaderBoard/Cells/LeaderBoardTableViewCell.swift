//
//  LeaderBoardTableViewCell.swift
//  pixuneSampleApp
//
//  Created by Ebrahim Hosseini on 2/27/21.
//

import UIKit
import Combine

class LeaderBoardTableViewCell: UITableViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak var nameLabel: UILabel!
    
    //MARK: - Properties
    private var subscribers = Set<AnyCancellable>()
    
    var viewModel: LeaderBoardCellViewModel? {
        didSet {
            self.setupBinding()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupBinding()
        
    }
    
    fileprivate func setupBinding() {
        viewModel?.$name
            .map {$0}
            .assign(to: \.text, on: self.nameLabel)
            .store(in: &subscribers)
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
    }
    
}
