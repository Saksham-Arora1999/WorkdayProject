//
//  ImageDetailView.swift
//  WorkdayProject
//
//  Created by user242726 on 6/15/23.
//

import SwiftUI

/// Detail View which shows the description of each image
///
struct DetailView: View {
    let detail: Detail
    var body: some View {
        ScrollView {
            VStack (spacing: 40) {
                Image(systemName: "heart.fill")
                    .frame(width: 300, height: 300)
                

                description
                
                otherDetails
                
            }
        }.padding()
    }
    
    /// Contains a heading (description) and the description text of the image
    private var description: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Description")
                .font(.largeTitle)
                .bold()
            
            Text(detail.description)
                .foregroundColor(Color.theme.green)
                .font(.title2)
                .multilineTextAlignment(.leading)
                .padding(.top, 10)
        }.padding()
            .background {
                BackgroundShadowBox(cornerRadius: 25, opacity: 0.2)
            }
    }
    
    /// Contains other details to be shown as part of the details
    private var otherDetails: some View {
        VStack(alignment: .leading) {
            
            if let photographer = detail.photographer {
                DetailRowView(field: "Photographer", value: photographer)
            }
            if let location = detail.location {
                DetailRowView(field: "Location", value: location)
            }
            DetailRowView(field: "Date Created: ", value: detail.dateCreated.formatted())
            
        }.padding(.top)
            .padding(.leading)
            .background {
            BackgroundShadowBox(cornerRadius: 25, opacity: 0.2)
        }
        
    }
}
    
    
struct ImageDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(detail: test.testDescription)
        }.preferredColorScheme(.dark)
        
    }
}
    
