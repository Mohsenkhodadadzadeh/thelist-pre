//
//  popularClientWidget.swift
//  popularClientWidget
//
//  Created by Mohsen on 1/28/22.
//

import WidgetKit
import SwiftUI
import Intents

struct widgetEntry: TimelineEntry {
    var date: Date
    let data: WidgetModel
    
}

struct widgetProvider: TimelineProvider {
    func placeholder(in context: Context) -> widgetEntry {
        return widgetEntry(date: Date(), data: WidgetModel(id: 1, barName: "Test Bar", barImageData: nil, barExpensiveLevel: 2))
    }
    
    
    @AppStorage("popularwidget",store: UserDefaults(suiteName: "group.com.mohsen.TheListTest"))
    var popularwidget: Data = Data()

    func getSnapshot(in context: Context, completion: @escaping (widgetEntry) -> Void) {
        guard let barObj = try? PropertyListDecoder().decode(WidgetModel.self, from: popularwidget) else {
            return
        }
        let entry = widgetEntry(date: Date(), data: barObj)
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<widgetEntry>) -> Void) {
        guard let barObj = try? PropertyListDecoder().decode(WidgetModel.self, from: popularwidget) else {
            return
        }
        let entry: widgetEntry = widgetEntry(date: Date(), data: barObj)
        let timeline = Timeline(entries: [entry], policy: .never)
        completion(timeline)
    }
     
    
}

struct PlaceholderView: View {
    var body: some View {
        SmallView(WidgetModel(id: 1, barName: "Test Bar", barImageData: nil, barExpensiveLevel: 2))
    }
}

struct WidgetEntryView: View {
    let entry: widgetProvider.Entry
    
    @Environment(\.widgetFamily) var family
    
    @ViewBuilder
    var body: some View {
        switch family {
        case .systemSmall:
            SmallView(entry.data)
        case .systemMedium:
            MediumView(entry.data)
        case .systemLarge:
            LargeView(entry.data)
        default:
            LargeView(entry.data)
        }
        
    }
}


@main
struct popularClientWidget: Widget {
    private let kind = "popularClientWidget"
    
    
    
    var body: some WidgetConfiguration {
        
        StaticConfiguration(
            kind: kind,
            provider: widgetProvider()) { entry in
            WidgetEntryView(entry: entry)
        }
        .supportedFamilies([.systemLarge, .systemMedium, .systemSmall])
        .configurationDisplayName("TheList Popular")
        .description("Popular bars on TheList app.")
        
        
    }
}

struct WidgetPriview: PreviewProvider {
    static var previews: some View {
        WidgetEntryView(entry: widgetEntry(date: Date(), data: WidgetModel(id: 1, barName: "Test Bar", barImageData: nil, barExpensiveLevel: 2)))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
