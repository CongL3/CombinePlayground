
import Foundation
import Combine

let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

var cancellable = timer
	.sink { completion in
		switch completion {
		case .finished:
			print(".finished")
		case .failure:
			print(".failure")
		}
	} receiveValue: { output in
		print(output)
	}










