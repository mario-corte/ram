//
//  AboutView.swift
//  RAM
//
//  Created by Mario Corte on 2/13/25.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    infoView
                    profileView
                }
                .padding(.horizontal)
                .padding(.top, 4)
                .padding(.bottom)
            }
            .scrollIndicators(.hidden)
            .navigationBarTitle("about", displayMode: .large)
        }
        .tabItem {
            Label("about", systemImage: "info.bubble")
        }
    }
}

private extension AboutView {
    var infoView: some View {
        ItemShadingContainerView(
            content:
                VStack {
                    Image("RAM_Portal")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity)
                        .frame(height: 250)
                        .clipped()
                        .background(Color.secondaryFill)
                    VStack(alignment: .leading) {
                        Text("about.api")
                            .font(.largeTitle)
                            .fontWeight(.black)
                        Text("about.api.description")
                            .font(.callout)
                            .padding(.top, 1)
                        Link(destination: URL(string: "https://rickandmortyapi.com")!) {
                            Text("about.api.website")
                                .font(.footnote)
                                .fontWeight(.semibold)
                                .underline()
                        }
                        .padding(.vertical)
                    }
                    .padding()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
        )
    }
    
    var profileView: some View {
        ItemShadingContainerView(
            content:
                VStack(alignment: .leading) {
                    Text("about.developedBy")
                        .font(.footnote)
                        .foregroundStyle(Color.secondaryLabel)
                        .padding(.top)
                    Text("about.author")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.top, -2)
                    Text("about.profile")
                        .font(.footnote)
                        .padding(.top, -6)
                    Link(destination: URL(string: "https://linkedin.com/in/mario-cort3")!) {
                        Image("Linkedin")
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .tint(.white)
                            .padding(.vertical)
                            .padding(.horizontal, 25)
                            .frame(height: 50)
                            .background(Color.linkedin)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .padding(.top, 14)
                    .padding(.bottom)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
        )
    }
}
