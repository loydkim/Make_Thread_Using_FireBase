//
//  ContentView.swift
//  FireBaseProject
//
//  Created by YOUNGSIC KIM on 2019-12-22.
//  Copyright © 2019 YOUNGSIC KIM. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct ContentView: View {
    @State private var textValue = ""
    @ObservedObject private var datas = firebaseData
    
    var body: some View {
        VStack {
            List {
                ForEach(datas.data){ data in
                    HStack {
                        DataRow(data: data)
                    }
                }
            }
            HStack {
                Spacer()
                TextField("Add text please", text: $textValue).textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: {
                    self.doItButton()
                }) {
                    Text("Submit")
                }
                Spacer()
            }
        }
    }
    
    func doItButton() {
        firebaseData.createData(msg1: self.textValue)
        textValue = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
