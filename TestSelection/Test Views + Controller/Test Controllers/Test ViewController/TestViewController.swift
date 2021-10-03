//
//  TestViewController.swift
//  TestSelection
//
//  Created by Mohamed Ali on 02/10/2021.
//

import UIKit
import RxSwift
import RxCocoa

class TestViewController: UIViewController {
    
    // MARK:- TODO:- This Section for IBOutlets in this page
    @IBOutlet weak var collectionView:UICollectionView!
    @IBOutlet weak var NextButton: UIButton!
    
    // MARK:- TODO:- This Section for Initialise new varibles here.
    let NibFileName = "DataCell"
    let CellIdentifier = "Cell"
    let testviewmodel = TestViewModel()
    let disposebag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ConfigureCollectionView()
        bindToCollectionView()
        GetData()
        
        SubscribeOnSelectedCell()
        BindToNextButtonAction()
    }
    
    // MARK:- TODO:- This Method For Regester CollectionView.
    func ConfigureCollectionView() {
        collectionView.delegate = self
        collectionView.register(UINib(nibName: NibFileName, bundle: nil), forCellWithReuseIdentifier: CellIdentifier)
    }
    // ------------------------------------------------
    
    // MARK:- TODO:- This Method For Bind Collection View For His Varible.
    func bindToCollectionView() {
        testviewmodel.arr.bind(to: collectionView.rx.items(cellIdentifier: CellIdentifier, cellType: DataCell.self)) {
            row,branch,cell in
            
        }.disposed(by: disposebag)
    }
    // ------------------------------------------------
    
    // MARK:- TODO:- This Method For Load Data From Database.
    func GetData() {
        testviewmodel.LoadData()
    }
    // ------------------------------------------------
    
    
    // MARK:- TODO:- This Method For Subscribe Action For Send Button.
    func BindToNextButtonAction() {
        NextButton.rx.tap.throttle(RxTimeInterval.milliseconds(500), scheduler: MainScheduler.instance).subscribe(onNext: { [weak self] _ in
            
            guard let self = self else { return }
            
            self.testviewmodel.SendOperation()
            
        }).disposed(by: disposebag)
    }
    // ------------------------------------------------
    
    // MARK:- TODO:- This Method For Making Action For Selected Cell in collectionView.
    func SubscribeOnSelectedCell() {
        
    collectionView.rx.itemSelected
      .subscribe(onNext: { [weak self] indexPath in
        
        guard let self = self else { return }
        
        let cell = self.collectionView.cellForItem(at: indexPath) as? DataCell
        
        // Check if cell is selected or not by identify it's border
        if cell?.View.layer.borderColor == UIColor.gray.cgColor {
            // call Method for Add Data to Array.
            self.testviewmodel.SetActiveCell(cell: cell!, indexPath: indexPath)
        }
        else {
            // call Method For Remove Data from Array
            self.testviewmodel.RemoveNonActiveCell(cell: cell!, indexPath: indexPath)
        }
        
      }).disposed(by: disposebag)
        
    }
    // ------------------------------------------------
}
