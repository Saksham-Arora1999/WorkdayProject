//
//  DetailRowView.swift
//  WorkdayProject
//
//  Created by user242726 on 6/15/23.
//

import SwiftUI


/// Row view for the extra details on the ImageDetailView
struct DetailRowView: View {
    let field: String
    let value: String
    
    var body: some View {
        HStack {
            Image(systemName: "circle.fill")
                .fixedSize()
                .background(.background)
            Text("\(field): \(value)")
                .foregroundColor(Color.theme.green)
                .font(.title3)
        }
        .padding(.bottom)
    }
}

struct DetailRowView_Previews: PreviewProvider {
    static var previews: some View {
        DetailRowView(field: "photographer", value: "Saksham")
    }
}
