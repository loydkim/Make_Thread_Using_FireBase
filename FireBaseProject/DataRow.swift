//
//  DataRow.swift
//  FireBaseProject
//
//  Created by YOUNGSIC KIM on 2019-12-31.
//  Copyright © 2019 YOUNGSIC KIM. All rights reserved.
//

import SwiftUI

struct DataRow: View {
    var data: ThreadDataType
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: data.userImage)
                    .resizable()
                    .frame(width: 44, height: 44)
                    .foregroundColor(data.imageColor)
                VStack(alignment: .leading) {
                    Text(data.userID).font(.body).bold()
                    Text(data.date).font(.subheadline).foregroundColor(Color.gray)
                }
                Spacer()
            }
            Text(data.content)
                .padding([.top, .leading], 6.0)
        }
    }
}

struct DataRow_Previews: PreviewProvider {
    static var previews: some View {
        DataRow(data: threadDataTest[0]).previewLayout(PreviewLayout.fixed(width: 500, height: 140))
    }
}
