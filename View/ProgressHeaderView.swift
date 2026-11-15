//
//  ProgressHeaderView.swift
//  Plant
//
//  Created by Eman Hisham Ghamri on 05/06/1448 AH.
//

import SwiftUI

struct ProgressHeaderView: View {
    let message: String
    let progress: Double      // a number from 0 to 1
    
    var body: some View {
        VStack(spacing: 12) {
            Text(message)
                .font(.callout)
            
            ProgressView(value: progress)
                .tint(Color(red: 0.1, green: 0.4, blue: 0.3))
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 16)
    }
}

#Preview {
    ProgressHeaderView(
        message: "3 of your plants feel loved today✨",
        progress: 0.75
    )
    .preferredColorScheme(.dark)
}
