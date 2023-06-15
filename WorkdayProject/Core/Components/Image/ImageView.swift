//
//  ImageView.swift
//  WorkdayProject
//
//  Created by user242726 on 6/15/23.
//

import SwiftUI

struct ImageView: View {
    
    
    @StateObject var vm: ImageViewModel
    
    init(_ data: NasaData) {
        _vm = StateObject(wrappedValue: ImageViewModel(data: data))
    }
    
    var body: some View {
        ZStack{
            
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(25)
            } else if vm.isLoading {
                ProgressView()
            } else {
                Image(systemName: "xmark")
                    .scaledToFit()
            }
        }.task {
            await vm.fetchImage()
        }
        
    }}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(test.testData)
    }
}
