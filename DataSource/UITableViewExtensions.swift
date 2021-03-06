//
//  UITableViewExtensions.swift
//  Example
//
//  Created by Matthias Buchetics on 25/11/15.
//  Copyright © 2015 aaa - all about apps GmbH. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    public func registerNib(identifier: String) {
        registerNib(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
    }
    
    public func heightForHeaderInSection(section: SectionType) -> CGFloat {
        return heightForHeaderFooterInSection(section)
    }
    
    public func heightForFooterInSection(section: SectionType) -> CGFloat {
        return style == .Grouped ? heightForHeaderFooterInSection(section) : 0
    }
    
    /**
        Returns the height for section headers and footers.
        We only want to show a section if it has any rows and we only want to show a section header if it has a title.
        Used to fix an issue where the section header height of empty sections in a grouped table view is calculated wrong by iOS.
    */
    func heightForHeaderFooterInSection(section: SectionType) -> CGFloat {
        if style == .Grouped {
            return section.numberOfRows > 0 ? UITableViewAutomaticDimension : CGFloat.min
        } else {
            return (section.numberOfRows > 0 && section.hasTitle) ? UITableViewAutomaticDimension : 0
        }
    }
}