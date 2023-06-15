//
//  ImageRowView.swift
//  WorkdayProject
//
//  Created by user242726 on 6/15/23.
//

import SwiftUI

struct ImageRowView: View {
    let data: NasaData
    
    var body: some View {
        HStack {
            ImageView(data)
                .frame(width: 50, height: 50)
                .padding(.trailing)
                .cornerRadius(10)
            
            
            Text("\(data.title)")
                .font(.title2)
                .bold()
                .foregroundColor(Color.theme.green)
                .lineLimit(1)
            
            
        }
        
    }
}

struct ImageRowView_Previews: PreviewProvider {
    static var previews: some View {
        ImageRowView(data: test.testData)
    }
}
