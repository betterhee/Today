//
//  ReminderListCell.swift
//  Today
//
//  Created by 홍다희 on 2021/04/14.
//

import UIKit

class ReminderListCell: UITableViewCell {
    typealias DoneButtonAction = () -> Void

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!

    private var doneButtonAction: DoneButtonAction?

    @IBAction func doneButtonTriggered(_ sender: UIButton) {
        doneButtonAction?()
    }

    func configure(title: String,
                   dateText: String,
                   isDone: Bool,
                   doneButtonAction: @escaping DoneButtonAction) {
        titleLabel.text = title
        dateLabel.text = dateText
        let image = isDone ? UIImage(systemName: "circle.fill") : UIImage(systemName: "circle")
        doneButton.setBackgroundImage(image, for: .normal)
        self.doneButtonAction = doneButtonAction
    }
}
