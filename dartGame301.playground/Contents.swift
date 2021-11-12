import UIKit


class Game {
    var totalScore = 0
    var roundScore = 0
    
    func playGame() {
        print("<301다트게임 시작>\n")
        for i in 0..<10 {
            print("\(i+1)라운드 시작")
            for j in 0..<3 {
                let dartScore = makeRandomDartScore()
                let multipliedDartScore = multiplyScore(dartScore)
                print("\(j+1)번 다트의 점수는 \(multipliedDartScore)점입니다.")
                roundScore += multipliedDartScore
            }
            totalScore += roundScore
            
            if totalScore == 301 {
                print("게임종료. \(i+1)라운드에서 301점을 달성하였습니다!")
                return
            } else if totalScore > 301 {
                print("Burst")
                totalScore -= roundScore
            } else {
            }
            print("\(i+1)라운드 종료, 현재점수:\(totalScore)\n")
        }
        print("게임종료. \(301-totalScore)점이 남았습니다.")
        return
    }
    
    
    func makeRandomDartScore() -> Int {
        var numArr = Array<Int>(0...20)
        numArr.append(50)
        
        return numArr.randomElement()!
    }
    
    func multiplyScore(_ dartScore : Int) -> Int {
        if dartScore == 0 || dartScore == 50 {
            return dartScore
        }
        
        let multipleArr = [1,1,1,1,1,1,1,2,2,3]
        let mulipleFactor = multipleArr.randomElement()!
        
        return dartScore * mulipleFactor
    }
    
}


let game = Game()
game.playGame()

