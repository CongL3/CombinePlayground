import Foundation
import Combine

let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

var counter = 0
let subscriber = timer
	.map({ (date) -> Void in
		counter += 1
	})
	.sink(receiveCompletion: { completion in
		print("completed")
	}, receiveValue: { _ in
		print("I am printing the counter \(counter)")
		if counter >= 5 {
			print("greater than 5")
			timer.upstream.connect().cancel()
		}
	})
