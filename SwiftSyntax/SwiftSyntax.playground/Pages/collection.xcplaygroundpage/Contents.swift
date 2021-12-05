//: [Previous](@previous)

import Foundation

//: Tuple
//                  0       1
let studentMark: (String, Int) = ("Alice", 49)
studentMark.0   // "Alice"
studentMark.1   // 49


let studentData = (name: "Alice", mark: 49, pet: "Choco")
//let theName = studentData.name // "Alice"
let theName = studentData.0
let theMark = studentData.mark // 49
let thePet = studentData.pet // "Choco"

/*: Array
- Array of Any : 정말 필요하지 않으면 사용하지 않는 것이 좋음. 같은 타입을 담는 것이 안전. 사용하는 측에서 타입체크를 해야 함
- 인덱스로 접근 가능
 */


//: Dictionary


//: Set


//: [Next](@next)
