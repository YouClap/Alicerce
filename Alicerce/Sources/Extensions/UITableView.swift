//
//  UITableView.swift
//  Alicerce
//
//  Created by Luís Afonso on 16/12/2016.
//  Copyright © 2016 Mindera. All rights reserved.
//

import UIKit

public extension UITableView {
    
    public func cell<T: ViewCellProtocol>(`for` indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            assertionFailure("🔥 Did you forgot to register cell with identifier `\(T.reuseIdentifier)` for type: `\(T.self)`")
            return T()
        }
        
        return cell
    }
    
    public func headerView<T: TableViewProtocol>() -> T {
        guard let view = self.dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T else {
            assertionFailure("🔥 Did you forgot to register view with identifier `\(T.reuseIdentifier)` for type: `\(T.self)`")
            return T()
        }
        
        return view
    }
    
    public func register<T: UITableViewCell>(_ cellType: T.Type) where T: ViewCellProtocol {
        register(cellType, forCellReuseIdentifier: cellType.reuseIdentifier)
    }
    
    public func registerHeaderFooterView<T: AnyObject>(_ viewType: T.Type) where T: ViewCellProtocol {
        register(viewType, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }
}