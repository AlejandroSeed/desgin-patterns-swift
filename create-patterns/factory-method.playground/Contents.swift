//For more information see this: https://refactoring.guru/es/design-patterns/factory-method

import UIKit

//MARK: Protocols
protocol ShopToBranch {
    func createPaymentMethod() -> PaymentMethod
}

protocol PaymentMethod {
    func pay()
    func deposit()
}

//MARK: Classes
class CreditCard: PaymentMethod{
    func pay() {
        print("Bank transaction!!!!")
        print("Money given")
        print("Finished")
    }
    
    func deposit() {
        print("Bank transaction!!!!")
        print("Money lost")
        print("Finished")
    }
}

class Cash: PaymentMethod{
    func pay() {
        print("Walking to the shop!!!!")
        print("Money given")
        print("Finished")
    }
    
    func deposit() {
        print("Walking to the shop!!!!")
        print("Money lost")
        print("Finished")
    }
}

class Shop {
    var branch: ShopToBranch?
    
    func pay(){
        let paymentMethod = branch?.createPaymentMethod()
        
        paymentMethod!.pay()
        
    }
    
    func deposit(){
        let paymentMethod = branch?.createPaymentMethod()
        
        paymentMethod!.deposit()
    }
}


class OnlineBranch: ShopToBranch{
    func createPaymentMethod() -> PaymentMethod {
        return CreditCard()
    }
}


class PhysicalBranch: ShopToBranch{
    var isCashMethod: Bool
    
    init(isCashMethod: Bool){
        self.isCashMethod = isCashMethod
    }
    
    func createPaymentMethod() -> PaymentMethod {
        if (isCashMethod){
            return Cash()
        }
        
        return CreditCard()
    }
}

//Application

var shop: Shop = Shop()
var isPhysicalBranch: Bool = true
var isCashMethod: Bool = true

func intitializate(){
    if isPhysicalBranch {
        shop.branch = PhysicalBranch(isCashMethod: isCashMethod)
        return
    }

    shop.branch = OnlineBranch()
}

intitializate()
shop.pay()
shop.deposit()
