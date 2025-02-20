//
//  EpisodeItemView.swift
//  RAM
//
//  Created by Mario Corte on 2/13/25.
//

import SwiftUI

struct EpisodeItemView: View {
    let viewModel: EpisodeViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(viewModel.number). \(viewModel.name)")
                .font(.callout)
            Text(viewModel.air_date)
                .font(.footnote)
                .foregroundStyle(Color.secondaryLabel)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .listRowSeparator(.hidden)
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(.fill)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .listRowBackground(Color.clear)
        .listRowInsets(.init(top: 4,
                             leading: 0,
                             bottom: 4,
                             trailing: 0))
    }
}
