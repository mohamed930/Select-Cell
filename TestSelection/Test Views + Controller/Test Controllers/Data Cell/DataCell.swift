//
//  DataCell.swift
//  TestSelection
//
//  Created by Mohamed Ali on 02/10/2021.
//

import UIKit

class DataCell: UICollectionViewCell {
    
    @IBOutlet weak var View: UIView!
    @IBOutlet weak var totextField: UITextField!
    @IBOutlet weak var fromtextField: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        ConfgiureViewCell()
    }
    
    func ConfgiureViewCell() {
        View.SetViewBorder(BorderColor: .gray, BorderSize: 1.2)
    }

}
