//
//  CheckListItem.swift
//  CheckLists
//
//  Created by lpiem on 23/1/2563 BE.
//  Copyright © 2563 lpiem. All rights reserved.
//

import Foundation


class CheckListItem {
    
    var text: String = ""
    var checked: Bool = false

    init(text: String, _ checked: Bool = false) {
        self.text = text
        self.checked = checked
    }


    func toggleChecked() {
        checked = !checked
    }

}
