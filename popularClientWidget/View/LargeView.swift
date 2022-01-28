//
//  LargeView.swift
//  TheListTest
//
//  Created by Mohsen on 1/28/22.
//

import SwiftUI
import WidgetKit

@available(iOS 14.0, *)
struct LargeView: View {
    
    var data: WidgetModel
    
    init(_ data: WidgetModel) {
        self.data = data
    }
    
    var body: some View {
        ZStack {
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Spacer()
                    Text(data.barName)
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.vertical, 3)
                    
                    Text("level of quality: \(Array(repeating: "⭐️", count: data.barExpensiveLevel).joined(separator: ""))")
                        .foregroundColor(.white)
                        .font(.caption)
                    Text("click here to see the the Bar on theList app".uppercased())
                        .foregroundColor(.white)
                        .font(.footnote)
                        .padding()
                }
                .padding()
                
                Spacer()
        }
            .background(
                ZStack {
                    if let strongData = data.barImageData, let image = UIImage(data: strongData) {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                           
                    }
                    LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0), Color.black.opacity(1)]), startPoint: .top, endPoint: .bottom)
                }
                
            )
            
        }
    }
}

@available(iOS 14.0, *)
struct LargeView_Previews: PreviewProvider {
    static var previews: some View {
        LargeView(WidgetModel(id: 1, barName: "test name", barImageData: nil, barExpensiveLevel: 1))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
