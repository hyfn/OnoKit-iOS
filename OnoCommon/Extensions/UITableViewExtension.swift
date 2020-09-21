//
//  Created by Onur Erdemol
//  Copyright © 2020 Onur Erdemol
//  All rights reserved
//

import UIKit

extension UITableView {

    convenience init(_ superview: UIView, _ style: UITableView.Style, _ handler: CommonTableViewHandler, _ identifiers: [String]) {

        self.init(frame: .zero, style: style)

        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false

        self.backgroundColor = .clear
        self.separatorStyle = .none

        self.delegate = handler
        self.dataSource = handler

        self.sectionHeaderHeight = UITableView.automaticDimension
        self.estimatedSectionHeaderHeight = 0

        self.sectionFooterHeight = UITableView.automaticDimension
        self.estimatedSectionFooterHeight = 0

        for identifier in identifiers {
            if let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String {
                if let anyClass: AnyClass = NSClassFromString("\(namespace).\(identifier)") {
                    self.register(anyClass, forCellReuseIdentifier: identifier)
                }
            }
        }

        superview.addSubview(self)

    }

}
