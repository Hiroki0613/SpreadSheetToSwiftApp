//
//  AppearTableView.swift
//  SpreadSheetToSwiftApp
//
//  Created by 宏輝 on 28/11/2019.
//  Copyright © 2019 Hiroki Kondo. All rights reserved.
//

import Foundation

protocol AppearTableViewDelegate {
    //tableViewをReloadする
    func reloadTableView()
}

class AppearTableView{
    
    var delegate:AppearTableViewDelegate? = nil
    
    func tableviewReload(ataiIn:Bool){
        print("tableViewをreloadします")
        
        //delegateがnilで無いときに、tableViewをreloadする
        if let dg = self.delegate {
            
            //alamofireでの通信が成功し、情報が取得されている
            if ataiIn == true {
                dg.reloadTableView()
            }
        } else {
            print("何もしません")
        }
        
    }
}
