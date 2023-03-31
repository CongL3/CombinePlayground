import Foundation
import Combine
// 4. promise(.success(number))
// 5. Never to Error
// 6. extend .sink to include receiveValue
// 7. print out completion in sink
// 8. add switch on completion + print
// 9. add promise(.failure(RandomError.error))

// https://developer.apple.com/documentation/combine/future
//

/*
 Future
 A publisher that eventually produces a single value and then finishes or fails.
 */

func generateAsyncRandomNumberFromFuture() -> Future <Int, Never> {
	return Future() { promise in
		DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
			let number = Int.random(in: 1...10)
			promise(Result.success(number))
		}
	}
}

var cancellable = generateAsyncRandomNumberFromFuture()
	.sink { completion in
		
		switch completion {
		case .finished:
			print(completion)
		case .failure:
			print(completion)
		}
	} receiveValue: { output in
		print("Got random number \(output).")
		
	}

