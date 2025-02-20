//
//  CharacterItemView.swift
//  RAM
//
//  Created by Mario Corte on 2/13/25.
//

import SwiftUI
import NukeUI

struct CharacterItemView: View {
    let viewModel: CharacterViewModel
    
    var body: some View {
        ItemShadingContainerView (
            content:
                VStack{
                    VStack {
                        LazyImage(url: viewModel.imageUrl, content: { image in
                            image.image?
                                .resizable()
                                .scaledToFill()
                        })
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 250)
                    .background(Color.secondaryFill)
                    .clipped()
                    VStack(alignment: .leading, content: {
                        Text(viewModel.name)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.label)
                            .multilineTextAlignment(.leading)
                        HStack {
                            viewModel.status.color
                                .frame(width: 10, height: 10)
                                .clipShape(.circle)
                            Text("\(viewModel.status.description) - \(viewModel.species)")
                                .font(.headline)
                                .foregroundStyle(Color.label)
                        }
                        .padding(.top, -16)
                        Text("character.lastKnownLocation")
                            .font(.subheadline)
                            .foregroundStyle(Color.secondaryLabel)
                            .padding(.top, 1)
                        Text(viewModel.location)
                            .font(.body)
                            .foregroundStyle(Color.label)
                        Text("character.firstSeenIn")
                            .font(.subheadline)
                            .foregroundStyle(Color.secondaryLabel)
                            .padding(.top, 1)
                        Text(viewModel.firstSeenIn)
                            .font(.body)
                            .foregroundStyle(Color.label)
                            .padding(.bottom)
                    })
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                }
        )
    }
}
