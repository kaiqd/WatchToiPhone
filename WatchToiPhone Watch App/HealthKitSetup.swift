//
//  HealthKitSetup.swift
//  WatchToiPhone
//
//  Created by Kaique Diniz on 29/11/24.
//

import HealthKit

let healthStore = HKHealthStore()

func requestHealthKitPermission(completion: @escaping (Bool) -> Void) {
    guard HKHealthStore.isHealthDataAvailable() else {
        print("O HealthKit não está disponível nesse dispositivo")
        completion(false)
        return
    }
    
    let heartRateType = HKQuantityType.quantityType(forIdentifier: .heartRate)!
    let stepCountType = HKQuantityType.quantityType(forIdentifier: .stepCount)!
    
    let typesToRead: Set<HKObjectType> = [heartRateType, stepCountType]
    
    healthStore.requestAuthorization(toShare: nil, read: typesToRead) { success, error in
        DispatchQueue.main.async {
            if success {
                print("Permissões concedidas!")
                completion(true)
            } else {
                print("Erro ao solicitar permissões: \(String(describing: error))")
                completion(false)
            }
        }
    }
}

func getHeartRateData(completion: @escaping (String) -> Void) {
    let heartRateType = HKQuantityType.quantityType(forIdentifier: .heartRate)!
    let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)
    let query = HKSampleQuery(sampleType: heartRateType, predicate: nil, limit: 1, sortDescriptors: [sortDescriptor]) { query, samples, error in
        guard let samples = samples as? [HKQuantitySample], let sample = samples.first else {
            print("Erro ao buscar batimentos")
            DispatchQueue.main.async {
                completion("Erro ao buscar")
            }
            return
        }
        
        let heartRate = sample.quantity.doubleValue(for: HKUnit(from: "count/min"))
        DispatchQueue.main.async {
            completion("\(heartRate)")
        }
    }
    
    healthStore.execute(query)
}

func getStepCount(completion: @escaping (String) -> Void) {
    let stepCountType = HKQuantityType.quantityType(forIdentifier: .stepCount)!
    let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)
    let query = HKSampleQuery(sampleType: stepCountType, predicate: nil, limit: 1, sortDescriptors: [sortDescriptor]) { query, samples, error in
        guard let samples = samples as? [HKQuantitySample], let sample = samples.first else {
            print("Erro ao buscar contagem de passos: \(String(describing: error))")
            DispatchQueue.main.async {
                completion("Erro ao buscar")
            }
            return
        }

        let stepCount = sample.quantity.doubleValue(for: HKUnit.count())
        DispatchQueue.main.async {
            completion("\(Int(stepCount))")
        }
    }

    healthStore.execute(query)
}
