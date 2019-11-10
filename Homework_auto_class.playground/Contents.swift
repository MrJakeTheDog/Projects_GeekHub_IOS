import UIKit

class Auto {
    var disp = Display()
    var engi = Engine()
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
    
    func changeBatteryCharge(_ charge: Int) {
        engi.battaryChange(value: charge)
        if charge > 0 {
            disp.displayOn = true
        } else {
            disp.displayOn = false
        }
    }
    
    func showBatteryCharge() {
        disp.battery(battery: engi.batteryCharge)
    }
    
    class Engine {
        var isOn = false
        let maxSpeed = 320.0
        var batteryCharge = 100
        func showEngineStatus() -> Bool{
            return isOn
        }
        
        func battaryChange(value: Int) {
            batteryCharge = value
        }
    }
    
    class Display {
        var displayOn = true
        func showInfo(speed: Double, isOn: Bool, modelOfCar: String) {
            if displayOn {
            print("Speed of auto: \(speed); Engine is on: \(isOn); Model: \(modelOfCar)")
            }
        }
        func battery(battery: Int) {
            print("Battery charge is: \(battery)")
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

myCar.showBatteryCharge()
myCar.changeBatteryCharge(23)
myCar.showBatteryCharge()
