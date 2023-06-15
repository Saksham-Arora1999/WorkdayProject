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
    let data: NasaData
    
    init(data: NasaData) {
        self.data = data
        print("Initialised")
    }
    
    var body: some View {
        ScrollView {
            VStack (spacing: 40) {
                
                ImageView(data)
                    .background {
                        BackgroundShadowBox(cornerRadius: 25, opacity: 0.2)
                    }
                
                description
                
                otherDetails
                
            }
        }.padding()
            .navigationTitle(data.title)
    }
    
    // MARK: Description
    /// Contains a heading (description) and the description text of the image
    private var description: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Description")
                .font(.largeTitle)
                .bold()
            
            Text(data.description)
                .foregroundColor(Color.theme.green)
                .multilineTextAlignment(.leading)
                .padding(.top, 10)
        }.padding()
            .background {
                BackgroundShadowBox(cornerRadius: 25, opacity: 0.2)
            }
    }
    
    // MARK: Other details
    /// Contains other details to be shown as part of the details
    private var otherDetails: some View {
        VStack(alignment: .leading) {
            
            if let photographer = data.photographer {
                DetailRowView(field: "Photographer", value: photographer)
            }
            if let location = data.location {
                DetailRowView(field: "Location", value: location)
            }
            DetailRowView(field: "Date Created: ", value: UtilityFunctions.transformDate(dateString: data.dateCreated))
            
        }.padding()
            .padding()
            .background {
                BackgroundShadowBox(cornerRadius: 25, opacity: 0.2)
            }
        
    }
}
    
// MARK: Preview
struct ImageDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(data: test.testData)
        }.preferredColorScheme(.dark)
        
    }
}
    
