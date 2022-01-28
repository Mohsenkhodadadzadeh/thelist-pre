//
//  SmallView.swift
//  TheListTest
//
//  Created by Mohsen on 1/28/22.
//

import SwiftUI
import WidgetKit
@available(iOS 14.0, *)
struct SmallView: View {
    var data: WidgetModel
    
    init(_ data: WidgetModel) {
        self.data = data
    }
    var body: some View {
        HStack {
            Spacer()
        VStack(alignment: .leading, spacing: 5) {
            Spacer()
            Text(data.barName)
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding(.vertical, 3)
            
            Text("level of quality: \(Array(repeating: "⭐️", count: data.barExpensiveLevel).joined(separator: ""))")
                .foregroundColor(.white)
                .font(.caption)
            Spacer()
            
        }
            Spacer()
        }
        .background(
            Color
                .black
                .edgesIgnoringSafeArea(.all)
        )
        
    }
}
@available(iOS 14.0, *)
struct SmallView_Previews: PreviewProvider {
   
    static var previews: some View {
        SmallView(WidgetModel(id: 1, barName: "test", barImageData: nil, barExpensiveLevel: 2))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
