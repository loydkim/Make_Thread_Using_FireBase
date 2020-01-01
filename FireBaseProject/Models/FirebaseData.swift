//
//  Data.swift
//  FireBaseProject
//
//  Created by YOUNGSIC KIM on 2019-12-29.
//  Copyright © 2019 YOUNGSIC KIM. All rights reserved.
//

import Firebase
import FirebaseFirestore

let dbCollection = Firestore.firestore().collection("dbTestSecond")
let firebaseData = FirebaseData()

class FirebaseData: ObservableObject {
    
    @Published var data = [ThreadDataType]()
    
    init() {
        readData()
    }
    
    // Reference link: https://firebase.google.com/docs/firestore/manage-data/add-data
    func createData(msg1:String) {
        // To create or overwrite a single document
        dbCollection.document().setData(["id" : dbCollection.document().documentID,"content":msg1,"userID":randomString(length: 14),"imageColor":randomColorStringArray1.randomElement()!.rawValue,"userImage":userRandomImageArray.randomElement()!,"date":makeToday()]) { (err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }else {
                print("create data success")
            }
        }
    }
    
    // Reference link : https://firebase.google.com/docs/firestore/query-data/listen
    func readData() {
        dbCollection.addSnapshotListener { (documentSnapshot, err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }else {
                print("read data success")
            }
            
            documentSnapshot!.documentChanges.forEach { diff in
                // Real time create from server
                if (diff.type == .added) {
                    let msgData = ThreadDataType(id: diff.document.documentID, userID: diff.document.get("userID") as! String, userImage: diff.document.get("userImage") as! String, imageColor: stringToColor(colorString: diff.document.get("imageColor") as! String), content: diff.document.get("content") as! String, date: diff.document.get("date") as! String)
                    self.data.append(msgData)
                }
                
                // Real time modify from server
                if (diff.type == .modified) {
                    self.data = self.data.map { (eachData) -> ThreadDataType in
                        var data = eachData
                        if data.id == diff.document.documentID {
                            data.content = diff.document.get("content") as! String
                            data.userID = diff.document.get("userID") as! String
                            data.userImage = diff.document.get("userImage") as! String
                            data.imageColor = stringToColor(colorString: diff.document.get("imageColor") as! String)
                            data.date = diff.document.get("date") as! String
                            return data
                        }else {
                            return eachData
                        }
                    }
                }   
            }
        }
    }
    
    //Reference link: https://firebase.google.com/docs/firestore/manage-data/delete-data
    func deleteData(datas: FirebaseData ,index: IndexSet) {
        let id = datas.data[index.first!].id
        dbCollection.document(id).delete { (err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }else {
                print("delete data success")
            }
            datas.data.remove(atOffsets:index)
        }
    }
    
    // Reference link: https://firebase.google.com/docs/firestore/manage-data/add-data
    func updateData(id: String, txt: String) {
        dbCollection.document(id).updateData(["content":txt]) { (err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }else {
                print("update data success")
            }
        }
    }
}
