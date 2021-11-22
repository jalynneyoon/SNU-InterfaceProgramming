import UIKit


protocol Game {
    func playGame()
}

class DartGame301 {
    enum MultiplyingNum : Int {
        case single = 1
        case double = 2
        case triple = 3
    }
    
    func makeRandomDartScore() -> Int {
        var numArr = Array<Int>(0...20)
        numArr.append(50)
        return numArr.randomElement()!
    }
    
    func getmultiplyingNum(_ dartScore : Int) -> Int {
        if dartScore == 0 || dartScore == 50 {
            return 1
        }
        let multiplyArr = [1,1,1,1,1,1,1,2,2,3]
        return multiplyArr.randomElement()!
    }
}


extension DartGame301 : Game {
    func playGame() {
        print("<301다트게임 시작>\n")
        var totalScore = 0
        
        for i in 0..<10 {
            print("\(i+1)라운드 시작")
            var roundScore = 0
            
            for j in 0..<3 {
                let dartScore = makeRandomDartScore()
                let multiplyingNum = getmultiplyingNum(dartScore)
                guard let multiplyingStr = MultiplyingNum(rawValue: multiplyingNum) else { return }
                
                let totalDart = multiplyingNum * dartScore
                roundScore += totalDart
                
                print("\(j+1)번 다트의 점수는 \(dartScore)이고 \(multiplyingStr)입니다. 현재까지의 Total Score는 \(totalScore + roundScore)점입니다.")
                
                if totalScore + roundScore > 301 {
                    print("----Burst입니다. \(i+1)라운드를 더 이상 진행하지 않습니다.")
                    roundScore = 0
                    break
                }
            }
            
            totalScore += roundScore
            if totalScore == 301 {
                print("\n게임종료. \(i+1)라운드에서 301점을 달성하였습니다!")
                return
            }
            print("\(i+1)라운드 종료. 현재점수:\(totalScore)\n")
        }
        print("게임종료. 301점까지 \(301-totalScore)점이 남았습니다.")
    }
}


let dartGame = DartGame301()
dartGame.playGame()
