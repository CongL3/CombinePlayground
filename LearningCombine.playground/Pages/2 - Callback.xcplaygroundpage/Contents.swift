import UIKit
import Combine

// Int = 10, error = nil - looks like this succeeded
// Int = nil, error = ImportantError.error - looks like this failed

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

