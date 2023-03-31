//: [Previous](@previous)

import Foundation

func generateRandomNumber(completion: @escaping (Int?, ImportantError?) -> Void) {
	DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
		let number = Int.random(in: 1...10)
		//        completion(number, nil)
		completion(nil, ImportantError.error)
	}
}

generateRandomNumber { output, error in
	if let output = output {
		print("output received: \(output)")
	}
	
	if let error = error {
		print("error received: \(error)")
	}
}
