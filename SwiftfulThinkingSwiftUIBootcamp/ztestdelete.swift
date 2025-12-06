//
//  ztestdelete.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 12/5/25.
//

import SwiftUI

struct TinderCardView: View {
    let imageName: String
    let onTap: () -> Void

    var body: some View {
        ZStack(alignment: .bottom) {
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 260, height: 320)
                .background(.white)
                .cornerRadius(20)
                .shadow(radius: 10)
                .onTapGesture { onTap() }
        }
    }
}

struct CardGalleryView: View {
    let images: [String]

    var body: some View {
        TabView {
            ForEach(images, id: \.self) { img in
                Image(systemName: img)
                    .resizable()
                    .scaledToFit()
                    .padding()
            }
        }
        .tabViewStyle(.page)
        .background(.black.opacity(0.9))
    }
}

struct TinderMainView: View {
    @State private var cards = ["person.crop.circle", "star", "flame", "bolt"]
    @State private var currentIndex = 0
    @State private var showGallery = false

    var currentCard: String { cards[currentIndex] }

    var body: some View {
        ZStack {
            Color(.systemGray6).ignoresSafeArea()

            VStack {
                Spacer()

                TinderCardView(imageName: currentCard) {
                    showGallery = true
                }

                Spacer()
            }

            HStack {
                Button {
                    swipeLeft()
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .frame(width: 70, height: 70)
                        .foregroundStyle(.red)
                        .shadow(radius: 5)
                }
                .padding(.leading, 40)

                Spacer()

                Button {
                    swipeRight()
                } label: {
                    Image(systemName: "heart.circle.fill")
                        .resizable()
                        .frame(width: 70, height: 70)
                        .foregroundStyle(.green)
                        .shadow(radius: 5)
                }
                .padding(.trailing, 40)
            }
            .padding(.bottom, 60)
        }
        .sheet(isPresented: $showGallery) {
            CardGalleryView(images: cards)
        }
    }

    func swipeLeft() {
        if currentIndex < cards.count - 1 {
            currentIndex += 1
        }
    }

    func swipeRight() {
        if currentIndex < cards.count - 1 {
            currentIndex += 1
        }
    }
}

#Preview {
    TinderMainView()
}
