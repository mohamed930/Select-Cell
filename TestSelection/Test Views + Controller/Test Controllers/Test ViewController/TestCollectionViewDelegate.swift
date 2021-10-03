//
//  TestCollectionViewDelegate.swift
//  TestSelection
//
//  Created by Mohamed Ali on 02/10/2021.
//

import UIKit

extension TestViewController: UICollectionViewDelegateFlowLayout {
    
    // MARK:- TODO:- This Method For Making two cell show in the line and make the hight 222.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cell_Width = (self.collectionView.frame.width - 10) / 2
        return CGSize(width: cell_Width, height: 222)
    }
    // ------------------------------------------------
    
    // MARK:- TODO:- This Method for making the distance between cells is 10 cm.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    // ------------------------------------------------
}
