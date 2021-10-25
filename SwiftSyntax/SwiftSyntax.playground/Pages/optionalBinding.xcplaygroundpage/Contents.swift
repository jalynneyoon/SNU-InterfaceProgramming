import UIKit


//: Multiple Optional Binding
var petName : String?
petName = "name"
var petAge: Int? = 2

if let petName = petName,
   let petAge = petAge {
    print(petName)
    print(petAge)
} else {
    print("I don't have any pet")
}

//: Nil Coalescing
var optionalInt : Int? = 10
var requiredResult = optionalInt ?? 0 // default value를 설정한다.
print(requiredResult)

