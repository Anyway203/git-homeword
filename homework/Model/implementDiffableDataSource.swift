//
//  implementDiffableDataSource.swift
//  implement
//
//  Created by ESB17979 on 2022/6/24.
//

import Foundation
import UIKit

enum Section {
    case all
}

class implementDiffableDataSource: UITableViewDiffableDataSource<Section, TodoInfo> {

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }

}
