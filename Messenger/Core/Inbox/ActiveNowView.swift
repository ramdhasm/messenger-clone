//
//  ActiveNowView.swift
//  Messenger
//
//  Created by Ramdhas on 2023-10-05.
//

import SwiftUI

struct ActiveNowView: View {
    var body: some View {
        ScrollView(.horizontal ,showsIndicators: false) {
            HStack(spacing: 32) {
                ForEach(1...15, id: \.self) { user in
                    VStack{
                        ZStack(alignment: .bottomTrailing) {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .frame(width: 64, height: 64)
                                .foregroundColor(Color(.systemGray4))
                            
                            ZStack{
                                Circle()
                                    .frame(width: 18, height: 18)
                                    .foregroundColor(.white)
                                Circle()
                                    .frame(width: 12, height: 12)
                                    .foregroundColor(.green)
                            }
                        }
                        Text("Ramdhas")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding()
        }
        .frame(height: 106)
    }
}

struct ActiveNowView_Previews: PreviewProvider {
    static var previews: some View {
        ActiveNowView()
    }
}
