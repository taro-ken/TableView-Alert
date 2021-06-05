//
//  TableViewCell.swift
//  TableView-Alert
//
//  Created by 木元健太郎 on 2021/06/05.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet private weak var Label: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        Label?.text = nil
    }
    
    func configure(user: Model) {
        Label?.text = user.text
    }
    
    static func cellHeight(user: Model) -> CGFloat {
        /*読み込むデータに対して高さだけ決める*/
        return 1000
      }
}
    
