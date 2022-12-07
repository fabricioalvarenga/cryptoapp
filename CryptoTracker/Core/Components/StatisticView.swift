//
//  StatisticView.swift
//  CryptoTracker
//
//  Created by FABRICIO ALVARENGA on 03/12/22.
//

import SwiftUI

struct StatisticView: View {
    let statistic: StatisticModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(statistic.title)
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
            
            Text(statistic.value)
                .font(.headline)
                .foregroundColor(Color.theme.accent)
            
            HStack(spacing: 4) {
                Image(systemName: "triangle.fill")
                    .font(.caption)
                    .rotationEffect(Angle(degrees: (statistic.percentageChange ?? 0) >= 0 ? 0 : 180))
                
                Text(statistic.percentageChange?.asPercentString() ?? "")
                    .font(.caption)
                    .bold()
            }
            .foregroundColor((statistic.percentageChange ?? 0) >= 0 ? Color.theme.green : Color.theme.red)
            .opacity(statistic.percentageChange == nil ? 0.0 : 1.0)
            
        }
    }
}

struct StatisticView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StatisticView(statistic: StatisticModel.example1)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
            StatisticView(statistic: StatisticModel.example2)
                .previewLayout(.sizeThatFits)
            StatisticView(statistic: StatisticModel.example3)
                .previewLayout(.sizeThatFits)
        }
    }
}
