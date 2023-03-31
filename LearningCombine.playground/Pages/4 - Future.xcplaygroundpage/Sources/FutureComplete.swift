import Foundation
import Combine

func generateAsyncRandomNumberFromFuture() -> AnyPublisher <Int, Error> {
	return Future() { promise in
		DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
			let number = Int.random(in: 1...10)
			promise(.success(number))
			//promise(.failure(RandomError.error))
		}
	}.map { value in
		return value + 100
	}
	.filter({ number in
		return true
	})
	.eraseToAnyPublisher()
}

var cancellable = generateAsyncRandomNumberFromFuture()
	.sink { completion in
		
		switch completion {
		case .finished:
			print(completion)
		case .failure:
			print(completion)
		}
	} receiveValue: { value in
		print(value)
	}
