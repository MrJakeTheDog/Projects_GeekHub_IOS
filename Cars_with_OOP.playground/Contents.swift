import Cocoa

class Auto {
    fileprivate var disp = Display()
    fileprivate var engi = Engine()
    var speed = 0.0
    let model: String
    let color: String
    
    init(model: String, color: String) {
        self.model = model
        self.color = color
    }
    
    func addSpeed (_ sp: Double) {
        if engi.isOn {
            if ((speed + sp) > engi.maxSpeed) {
                speed = engi.maxSpeed
            }
            else  {
                speed += sp
            }
        }
    }
    
    func slow(_ sp: Double) {
        if engi.isOn {
            speed -= sp
        }
    }
    
    func turnOff() {
        speed = 0
        engi.isOn = false
    }
    
    func turnOn() {
        engi.isOn = true
    }
    
    func info() {
        disp.showInfo(speed: speed, isOn: engi.isOn, modelOfCar: model)
    }
    
    fileprivate class Engine {
        var isOn = false
        let maxSpeed = 320.0
        func showEngineStatus() -> Bool{
            return isOn
        }
    }
    
    fileprivate class Display {
        var displayOn = true
        func showInfo(speed: Double, isOn: Bool, modelOfCar: String) {
            if displayOn {
                print("Speed of auto: \(speed); Engine is on: \(isOn); Model: \(modelOfCar)")
            }
        }
    }
    
}

class Tractor : Auto {
    var tractorLadle = Ladle()
    
    override func turnOff() {
        speed = 0
        engi.isOn = false
        tractorLadle.modeOn = false
    }
    
    override func turnOn() {
        engi.isOn = true
        tractorLadle.modeOn = true
    }
    
    class Ladle {
        var modeOn = false
        var ladleUp = false
        var ladleRight = false
        var ladleLeft = false
        
        func on() {
            modeOn = true
        }
        
        func off() {
            modeOn = false
            ladleUp = false
            ladleRight = false
            ladleLeft = false
        }
        
        func turnUp(_ set: Bool) {
            ladleUp = true
        }
        
        func turnRight(_ set: Bool) {
            ladleRight = true
            ladleLeft = false
        }

        func turnLeft(_ set: Bool) {
            ladleLeft = true
            ladleRight = false
        }
    }
}

var myCar = Auto(model: "Audi", color: "Green")

myCar.turnOn()
myCar.addSpeed(123)
myCar.info()
myCar.slow(92)
myCar.info()
myCar.turnOff()
myCar.info()

var myTractor = Tractor(model: "Niva", color: "Blue")

myTractor.turnOn()
myTractor.info()

var f = [1, 2, 3, 4, 5, 6, 7, 8, 9].filter { $0 % 2 == 1 }
print(f);

var m = [1, 2, 3, 4, 5, 6, 7, 8, 9].map { $0 * 10 }
print(m)


func filtration(_ none: [Int], _ f: (Int) -> Bool ) -> [Int] {
    var bucket = [Int]()
    for i in none {
        if f(i) {
            bucket.append(i)
        }
    }
    return bucket
}

print("Filter:")
var filt = filtration([1, 2, 3, 4, 4, 57, 7, 8, 9], { $0 % 2 == 1 })
print(filt)

func mapSecond(_ none: [Int], _ f: (Int) -> Int ) -> [Int] {
    var bucket = [Int]()
    for i in none {
        bucket.append(f(i))
    }
    return bucket
}
print("Map:")
var map = mapSecond([1,54,6,2,12,6,4,2], { $0 * 5})
print(map)

func sorting(_ none: [Int], _ f: (Int, Int) -> Bool ) -> [Int] {
    var bucket = [Int]()
    let count = none.count
    var trash = [Int]()
    for i in 0..<count {
        trash.append(none[i])
    }
    
    for i in 0..<count {
        for j in 0..<count {
            if f(i,j) {
                trash.swapAt(i, j)
            }
        }
    }
    bucket = trash
    return bucket
}
print("Sort: ")
var sort = sorting([7, 6, 5, 4, 3, 2, 1], { $0 > $1 })
print(sort)

extension Array {
    func filtered(_ number: (Element) -> Bool) {
        print("Filter:")
        for numberInCounter in self {
            if number(numberInCounter) {
                print(numberInCounter)
            }
        }
    }
    
    func map(_ number: (Element) -> Bool) {
        print("Map:")
        for numberInCounter in self {
            print(number(numberInCounter))
        }
    }
}

[1,2,23,4,3,19].filtered {  $0 % 2 == 1 }
[1,2,23,4,3,19].map { $0 * 5 }
