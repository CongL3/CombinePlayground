//import Foundation
//
//// Swift Result<Int, ImportantError>
//func generateRandomNumber(completion: @escaping (Result<Int, ImportantError>) -> Void) {
//	DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//		let number = Int.random(in: 1...10)
//		
//		completion(.success(number))
//		//completion(.failure(ImportantError.error))
//	}
//}
//
//
//generateRandomNumber { result in
//	switch result {
//	case .success(let success):
//		print(success)
//	case .failure(let failure):
//		print(failure)
//	}
//}
//// Int = 10 looks like this succeeded
//// error = ImportantError.error - looks like this failed
