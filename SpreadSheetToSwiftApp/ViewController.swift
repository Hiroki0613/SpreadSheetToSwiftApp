//
//  ViewController.swift
//  SpreadSheetToSwiftApp
//
//  Created by 宏輝 on 05/10/2019.
//  Copyright © 2019 Hiroki Kondo. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var spreadSheetTableView: UITableView!
    
    var ID_Array = [String]()
    var name_Array = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        spreadSheetTableView.delegate = self
        spreadSheetTableView.dataSource = self
        
        getData()
    }

     // MARK: - TableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name_Array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = spreadSheetTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let cellID = cell.viewWithTag(1) as! UILabel
        cellID.text = ID_Array[indexPath.row]
        
        let cellName = cell.viewWithTag(2) as! UILabel
        cellName.text = name_Array[indexPath.row]
        
        return cell
        
    }
    
    
    
    
    // MARK: - API通信
    func getData(){
        
        //非同期処理開始
        DispatchQueue.global().async {
            
            //同期処理開始
            DispatchQueue.main.async {
                
                let url = "https://script.google.com/macros/s/AKfycbxH8Ec89wktvxtwoMBTCvNXK1g5fcfiAbhZadXXscxd54Lt2Ng/exec"
                
            
                       
                //Alamofireを使ってhttpsリクエスト
                Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { (response) in
                           
                    //responceをswith文で分岐する
                    switch response.result{
                    case .success:
                        
                        //swiftyJSONを使って、JSON解析
                        for i in 0...19{
                            let json:JSON = JSON(response .data as Any)
                            let ID_String = json["jsondata"][i]["id"].string
                            let Name_String = json["jsondata"][i]["name"].string
                            
                            self.ID_Array.append(ID_String!)
                            self.name_Array.append(Name_String!)
                                   
                            print("hirohiro1")
                            print(self.ID_Array)
                            print("hirohiro2")
                            print(self.name_Array)
                            
                        }
                        
                    case .failure(let error):
                        print(error)
            
                    }
                    
                }
            
            }
            //同期処理終了
        
        }
        //非同期処理終了
        
    }
    
    
    
    
    /*
     参考にしたURL
     Googleスプレッドシートの内容をjsonデータとして利用する
     https://www.koreyome.com/web/make-spreadsheet-to-json-at-google-apps-script/
     */

}

