//
//  ItemShadingContainerView.swift
//  RAM
//
//  Created by Mario Corte on 2/13/25.
//

import SwiftUI

struct ItemShadingContainerView<Content: View>: View {
    @Environment(\.colorScheme) var colorScheme
    let content: Content
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(colorScheme == .light ? .background : Color.fill)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .shadow(radius: colorScheme == .light ? 8 : 0)
            content
                .clipShape(RoundedRectangle(cornerRadius: 16))
        }
    }
}
