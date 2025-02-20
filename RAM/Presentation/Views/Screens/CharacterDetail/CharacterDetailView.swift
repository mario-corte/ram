//
//  CharacterDetailView.swift
//  RAM
//
//  Created by Mario Corte on 2/13/25.
//

import SwiftUI
import NukeUI

struct CharacterDetailView: View {
    let viewModel: CharacterDetailViewModel
    
    var body: some View {
        ScrollView  {
            HeaderView(viewModel: viewModel)
            ContentView(viewModel: viewModel)
        }
        .scrollIndicators(.hidden)
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
        .toolbarTitleDisplayMode(.inline)
    }
}

private struct HeaderView: View {
    let viewModel: CharacterDetailViewModel
    
    var body: some View {
        let headerHeidht:CGFloat = 500
        GeometryReader { geometry in
            let offsetY = geometry.frame(in: .global).minY
            let isScrolled = offsetY > 0
            Spacer()
                .frame(height: isScrolled ? headerHeidht + offsetY : headerHeidht)
                .background {
                    LazyImage(url: viewModel.characterViewModel.imageUrl, content: { image in
                        image.image?
                            .resizable()
                            .scaledToFill()
                            .offset(y: isScrolled ? -offsetY : 0)
                            .scaleEffect(isScrolled ? offsetY/1000 + 1 : 1)
                    })
                }
        }
        .frame(height: headerHeidht)
    }
}

private struct ContentView: View {
    var viewModel: CharacterDetailViewModel
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, content: {
                Text(viewModel.characterViewModel.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.label)
                HStack {
                    viewModel.characterViewModel.status.color
                        .frame(width: 10, height: 10)
                        .clipShape(.circle)
                    Text("\(viewModel.characterViewModel.status.description) - \(viewModel.characterViewModel.species)")
                        .font(.headline)
                        .foregroundStyle(Color.label)
                }
                .padding(.top, -16)
                
                Text("character.gender")
                    .font(.subheadline)
                    .foregroundStyle(Color.secondaryLabel)
                    .padding(.top, 1)
                Text(viewModel.characterViewModel.gender.description)
                    .foregroundStyle(Color.label)
                
                Text("character.originaryFrom")
                    .font(.subheadline)
                    .foregroundStyle(Color.secondaryLabel)
                    .padding(.top, 1)
                Text(viewModel.characterViewModel.origin)
                    .foregroundStyle(Color.label)
                
                if !viewModel.characterViewModel.atSameLocation {
                    Text("character.currentLocation")
                        .font(.subheadline)
                        .foregroundStyle(Color.secondaryLabel)
                        .padding(.top, 1)
                    Text(viewModel.characterViewModel.location)
                        .foregroundStyle(Color.label)
                }
                
                if viewModel.characterViewModel.appearedOnce {
                    Text("character.seenIn")
                        .font(.subheadline)
                        .foregroundStyle(Color.secondaryLabel)
                        .padding(.top, 1)
                    Text(viewModel.characterViewModel.firstSeenIn)
                        .foregroundStyle(Color.label)
                        .padding(.bottom, 10)
                }
                else {
                    Text("character.lastKnownEpisode")
                        .font(.subheadline)
                        .foregroundStyle(Color.secondaryLabel)
                        .padding(.top, 1)
                    Text(viewModel.characterViewModel.lastSeenIn)
                        .foregroundStyle(Color.label)
                    
                    Text("character.firstSeenIn")
                        .font(.subheadline)
                        .foregroundStyle(Color.secondaryLabel)
                        .padding(.top, 1)
                    Text(viewModel.characterViewModel.firstSeenIn)
                        .foregroundStyle(Color.label)
                        .padding(.bottom, 10)
                }
            })
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .padding(.bottom, 60)
        }
        .background(.background)
        .containerShape(RoundedRectangle(cornerRadius: 20))
        .offset(y: -20)
    }
}

private extension CharacterDetailView {
    var backButton : some View {
        Button {
            viewModel.coordinator.pop()
        } label: {
            Image(systemName: "chevron.backward.circle.fill")
        }
        .foregroundStyle(.primary)
    }
}
