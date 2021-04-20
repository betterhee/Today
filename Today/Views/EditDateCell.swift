//
//  EditDateCell.swift
//  Today
//
//  Created by 홍다희 on 2021/04/14.
//

import UIKit

class EditDateCell: UITableViewCell {
    typealias DateChangeAction = (Date) -> Void

    @IBOutlet weak var datePicker: UIDatePicker!

    private var dateChangeAction: DateChangeAction?

    override func awakeFromNib() {
        super.awakeFromNib()
        datePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
    }

    func configure(date: Date, changeAction: DateChangeAction?) {
        datePicker.date = date
        self.dateChangeAction = changeAction
    }

    @objc
    func dateChanged(_ sender: UIDatePicker) {
        dateChangeAction?(sender.date)
    }
}

