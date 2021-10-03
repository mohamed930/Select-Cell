//
//  TestViewModel.swift
//  TestSelection
//
//  Created by Mohamed Ali on 02/10/2021.
//

import Foundation
import RxSwift
import RxCocoa

class TestViewModel {
    
    // MARK:- TODO:- Initialise new rx varibles here.
    var arr = BehaviorRelay<[DataModel]>(value: [])
    var selectedArr = BehaviorRelay<[DataModel]>(value: [])
    
    
    // MARK:- TODO:- This method for Getting Data from Database.
    func LoadData() {
        let data = [1,2,3,4,5,6]
        
        var d = Array<DataModel>()
        
        for i in data {
            let ob = DataModel(id: i, from: 0, to: 0)
            d.append(ob)
        }
        
        arr.accept(d)
        
    }
    // ------------------------------------------------
    
    
    // MARK:- TODO:- This Method For Make cell Active and add his data to array.
    func SetActiveCell(cell : DataCell ,indexPath: IndexPath) {
        
        cell.View.SetViewBorder(BorderColor: .green, BorderSize: 1.2)
        
        let data = arr.value
        
        guard let from = cell.fromtextField.text else {
            return
        }
        
        guard let to = cell.totextField.text else {
            return
        }
        
        var arr = Array<DataModel>()
        arr = selectedArr.value
        
        let selectedObj = DataModel(id: data[indexPath.row].id, from: Int(from) ?? 0, to: Int(to) ?? 0)
        arr.append(selectedObj)
        
        selectedArr.accept(arr)
        
        print("Element Selected")
        
        
    }
    // ------------------------------------------------
    
    
    // MARK:- TODO:- This Method For Make cell non Active and remove his data to array.
    func RemoveNonActiveCell(cell : DataCell ,indexPath: IndexPath) {
        
        cell.View.SetViewBorder(BorderColor: .gray, BorderSize: 1.2)
        
        let data = arr.value
        var selected = selectedArr.value
        
        for i in 0..<selected.count {
            if selected[i].id == data[indexPath.row].id {
                selected.remove(at: i)
                break;
            }
        }
        
        selectedArr.accept(selected)
        
        print("Remove Selected")
        
    }
    // ------------------------------------------------
    
    // MARK:- TODO:- This Method For Send Button Action.
    func SendOperation() {
        
        let selectedArr = selectedArr.value
        
        if selectedArr.count == 0 {
            print("Please, pick elemnets")
        }
        else {
            print(selectedArr.count)
            for i in 0..<selectedArr.count {
                print("Selected cell No. [\(i)]: id: \(selectedArr[i].id), from: \(selectedArr[i].from), to: \(selectedArr[i].to)")
            }
        }
        
    }
    // ------------------------------------------------
}
