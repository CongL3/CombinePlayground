import Foundation
import Combine

/*
 Compact Map
 */

let result = ["one", "2", "three", "4", "5"].compactMap({ Int($0) })
//print(result)
// [2, 4, 5]


//["one", "2", "three", "4", "5"]
//	.publisher
//	.compactMap({ Int($0) })
//	.sink(receiveValue: { int in
//		print(int)
//		}
//	)

/*
 Flat Map
 */

let numbers = [1, 2, 3, 4]
let mapped = numbers.map { Array(repeating: $0, count: $0) }
// [[1], [2, 2], [3, 3, 3], [4, 4, 4, 4]]
let flatMapped = numbers.flatMap { Array(repeating: $0, count: $0) } // [1, 2, 2, 3, 3, 3, 4, 4, 4, 4]

let baseURL = URL(string: "https://www.donnywals.com")!
var cancellables = Set<AnyCancellable>()

["/", "/the-blog", "/speaking", "/newsletter"]
	.publisher
	.setFailureType(to: URLError.self) // This is only needed on iOS 13
	.flatMap({ path -> URLSession.DataTaskPublisher in
	let url = baseURL.appendingPathComponent(path)
	return URLSession.shared.dataTaskPublisher(for: url) })
	.sink(receiveCompletion: { completion in
		print("Completed with: \(completion)")
	}, receiveValue: { result in print(result)})
	.store(in: &cancellables)


/*
 Limiting the number of active publishers that are produced by flatMap
 */

//[1, 2, 3]
//	.publisher
//	.print()
//	.flatMap({ int in
//		return Array(repeating: int, count: 2).publisher })
//	.sink(receiveValue: { value in
//		print("got: \(value)")
//	})
