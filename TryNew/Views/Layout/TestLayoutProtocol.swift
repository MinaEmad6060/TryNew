//
//  TestLayoutProtocol.swift
//  TryNew
//
//  Created by Mina Emad on 15/11/2025.
//

import SwiftUI

struct ZStackFlowLayout: Layout {
    
    func sizeThatFits(proposal: ProposedViewSize,
                      subviews: Subviews,
                      cache: inout ()) -> CGSize {
        
        // We calculate the max size of subviews
        var maxWidth: CGFloat = 0
        var maxHeight: CGFloat = 0
        
        for subview in subviews {
            let size = subview.sizeThatFits(proposal)
            maxWidth = max(maxWidth, size.width)
            maxHeight = max(maxHeight, size.height)
        }
        
        // Return the required size (all stacked, so no extra height)
        return CGSize(width: maxWidth, height: maxHeight + CGFloat(subviews.count - 1) * 10)
    }
    
    func placeSubviews(in bounds: CGRect,
                       proposal: ProposedViewSize,
                       subviews: Subviews,
                       cache: inout ()) {
        
        for (index, subview) in subviews.enumerated() {
            subview.place(
                at: CGPoint(
                    x: bounds.midX,
                    y: bounds.midY + CGFloat(index) * 10
                ),
                anchor: .center,
                proposal: proposal
            )
        }
    }
}

//
//#Preview {
//    ZStackFlowLayout {
//        ForEach(0..<4) { i in
//            RoundedRectangle(cornerRadius: 12)
//                .fill(.blue.opacity(Double(1.0 - Double(i) * 0.2)))
//                .frame(width: 120, height: 60)
//        }
//    }
//}

struct ContentView5: View {
    @State private var hero = false
    @Namespace var namespace
    var body: some View {
        let circle = Circle().fill(Color.green)
        ZStack {
            if hero {
                circle
                    .matchedGeometryEffect(id: "image", in: namespace)
            } else {
                circle
                    .matchedGeometryEffect(id: "image", in: namespace)
                    .frame(width: 30, height: 30)
            }
        }
        .onTapGesture {
            withAnimation(.default) { hero.toggle() }
        }
    }
}

#Preview {
    ContentView5()
}
