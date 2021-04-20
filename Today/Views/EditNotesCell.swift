//
//  EditNotesCell.swift
//  Today
//
//  Created by 홍다희 on 2021/04/14.
//

import UIKit

class EditNotesCell: UITableViewCell {
    typealias NotesChangeAction = (String) -> Void

    @IBOutlet weak var notesTextView: UITextView!

    private var notesChangeAction: NotesChangeAction?

    override func awakeFromNib() {
        super.awakeFromNib()
        notesTextView.delegate = self
    }

    func configure(notes: String?, changeAction: NotesChangeAction?) {
        notesTextView.text = notes
        self.notesChangeAction = changeAction
    }
}

extension EditNotesCell: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if let originalText = textView.text {
            let title = (originalText as NSString).replacingCharacters(in: range, with: text)
            notesChangeAction?(title)
        }
        return true
    }
}
