import UIKit

var str = "Hello, playground"

protocol AgeProtocol {

    associatedtype ItemAge
    var items: [ItemAge] { get set }
    mutating func push(_ item: ItemAge)
    mutating func pop() -> ItemAge
}

extension AgeProtocol {
    mutating func push(_ item: ItemAge) {
        items.insert(contentsOf: [item], at: 0)

    }
    mutating func pop() -> ItemAge {
        return items.removeFirst()

    }
}
struct StackAge<T>: AgeProtocol {
    typealias ItemAge = T
    var items: [T]
}


var myStack = StackAge(items: [10, 22, 3, 44, 18,12])
myStack.pop()
myStack.push(5)
myStack.items


struct ColorPerents {

    var black = "black"
    var white = "white"
    var red = "red"
    var grey = "grey"
    subscript(index: Int) -> String? {
        get {
            switch index {
            case 0:
                return black
            case 1:
                return white
            case 2:
                return red
            case 3:
                return grey
            default:
                return "Нет такого цвета"
            }
        }
    }
}

var changeColor = ColorPerents()
changeColor[3]

struct Family {

    var father = "Father"
    var mother = "Mother"
    var kids = ["Jon", "Lili", "Ameli"]
    var count: Int {
        return 2 + kids.count
    }

    subscript(index: Int) -> String? {
        get {
            switch(index) {
            case 0: return father
            case 1: return mother
            case 2..<(2 + kids.count): return kids [index - 2]
            default: return nil
            }
        }
        set {
            let value = newValue ?? ""

            switch(index) {
            case 0: return father = value
            case 1: return mother = value
            case 2..<(2 + kids.count): kids [index - 2] = value
            default: break

            }
        }
    }
}

var family = Family()
family.father
family.mother
family.kids[0]
family.count

family[0]
family[1]
family[2]

//Замыкания

let shops:[String:Double] = ["ВкусВил": 21000,"Перекресток": 35000,"Пятерочка": 19000,"АзбукаВкуса": 55000,"Ашан": 33000]

func filterShops(shops:[String:Double],filter:(Double)->Bool)->[String:Double]{

    var filtredShops = [String:Double]()
    for (key,value) in shops {
        if filter(value){
            filtredShops[key] = value
        }
    }
    return filtredShops
}

func highProfit(p:Double)->Bool{
    if p > 21000{
    return true
    }
    return false
}

let shopsLowProfit = filterShops(shops: shops, filter: { $0 < 20000})
let shopsHighProfit = filterShops(shops: shops, filter: { (p:Double)->Bool in
                                    return p > 21000})


print(shopsLowProfit)
print(shopsHighProfit)
