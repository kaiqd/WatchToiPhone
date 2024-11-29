//
//  HealthKitView.swift
//  WatchToiPhone
//
//  Created by Kaique Diniz on 29/11/24.
//

import SwiftUI

struct HealthKitView: View {
    @State private var heartRate: String = "Aguardando..."
    @State private var steps: String = "Aguardando..."
    @State private var isAuthorized: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            if isAuthorized {
                Text("Batimentos cardíacos: \(heartRate) bpm")
                    .font(.system(size: 15))
                    .padding()
                Text("\(steps) passos")
                    .padding()
                
                Button("Atualizar Dados") {
                    updateHealthData()
                }
                .padding()
//                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            } else {
                Text("Solicitando permissão para o HealthKit...")
                    .padding()
            }
        }
        .padding()
        .onAppear {
            requestHealthKitPermission { authorized in
                isAuthorized = authorized
                if authorized {
                    updateHealthData()
                }
            }
        }
    }
    
    private func updateHealthData() {
        getHeartRateData { heartRateValue in
            heartRate = heartRateValue
        }
        getStepCount { stepCountValue in
            steps = stepCountValue
        }
    }
}

#Preview {
    HealthKitView()
}
