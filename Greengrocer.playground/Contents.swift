import UIKit

/* Comment Kdoc
 @author Gabriele Zagarella
 @project Greengrocer
 
 Un fruttivendolo ha diversi tipi di frutta: mele, pere, arance, etc.
 Ogni frutta ha un nome, peso, un prezzo (diversi per ogni frutto)
 ed un codice identificativo (anche questo diverso).
 La frutta è gestita da un gestore fruttivendolo.
 Il fruttivendolo deve essere in grado di:
 - Stampare il numero dei frutti del fruttivendolo per categoria.
    Esempio: "Ci sono 3 mele, 4 pere e 2 arance".
 - Stampare il valore totale del fruttivendolo. Cioè devi sommare il prezzo di tutti i frutti.
 - Vendere un frutto. Dato il codice identificativo del frutto, lo deve cercare all'interno dell'arrey ed eliminare.
 Suggerimento: Crea un array per ogni tipo di frutto.
*/

class Fruit {
    var name: String;
    var weight: Double;
    var price: Double;
    var code: Int;
    
    init(nameFruit: String, weightFruit: Double, priceFruit: Double, codeFruit: Int) {
        self.name = nameFruit;
        self.weight = weightFruit;
        self.price = priceFruit;
        self.code = codeFruit;
    }
    
    func toString () {
        print("name: \(self.name), weight: \(self.weight), price: \(self.price)");
    }
}

"*...Created fruit objects...*"
var Apple = Fruit.init(nameFruit: "Apple", weightFruit: 20, priceFruit: 2, codeFruit: 001);
var Lemon = Fruit.init(nameFruit: "Lemon", weightFruit: 30, priceFruit: 1, codeFruit: 002);
var Banana = Fruit.init(nameFruit: "Banana", weightFruit: 50, priceFruit: 2, codeFruit: 003);

var applesArray:[Fruit] = [];
applesArray.append(Apple);

var lemonsArray:[Fruit] = [];
lemonsArray.append(Lemon);

var bananasArray:[Fruit] = [];
bananasArray.append(Banana);        

class Greengrocer {
    var name: String;
    
    init(names: String) {
        self.name = names;
    }
    
    func toStringFruitByCategoryApple() {
        for fruit in applesArray {
            fruit.toString();
        }
    }
    
    func toStringFruitByCategoryLemon() {
        for fruit in lemonsArray {
            fruit.toString();
        }
    }
    
    func toStringFruitByCategoryBanana() {
        for fruit in bananasArray {
            fruit.toString();
        }
    }
    
    func countFruitByCategory() {
        
        if applesArray.count == 0 {
            print("Tot \(lemonsArray.count) lemons, \(bananasArray.count) bananes");
        }else if lemonsArray.count == 0 {
            print("Tot \(applesArray.count) apples, \(bananasArray.count) bananes");
        }else if bananasArray.count == 0 {
            print("Tot \(applesArray.count) apples, \(lemonsArray.count) lemons");
        }else if applesArray.count == 0 && lemonsArray.count == 0 {
            print("Tot \(bananasArray.count) bananes");
        }else if applesArray.count == 0 && bananasArray.count == 0 {
            print("Tot \(lemonsArray.count) lemons");
        }else if lemonsArray.count == 0 && bananasArray.count == 0 {
            print("Tot \(applesArray.count) apples");
        }
        else {
            print("Tot \(applesArray.count) apples, \(lemonsArray.count) lemons, \(bananasArray.count) bananes");
       }
    }
    
    func priceApples() -> Double {
        var total: Double = 0;
        for apple in applesArray {
            total += apple.price;
        }
        return total;
    }
    
    func priceLemons() -> Double {
        var total: Double = 0;
        for lemon in lemonsArray {
            total += lemon.price
        }
        return total;
    }
    
    func priceBananas() -> Double {
        var total: Double = 0;
        for banana in bananasArray {
            total += banana.price;
        }
        return total;
    }
    
    func priceTotal() {
        print("Tot price fruits is: \(priceApples() + priceLemons() + priceBananas())");
    }
    
    func sell(codeFruit:Int, category:String) {
        switch category {
        case "Apple":
            for (index, apple) in applesArray.enumerated() {
                if apple.code == codeFruit {
                    applesArray.remove(at: index);
                    print("sold it");
                }else {
                    print("not sold");
                }
            }
            return
        case "Lemon":
            for (index, lemon) in lemonsArray.enumerated() {
                if lemon.code == codeFruit {
                    bananasArray.remove(at: index)
                    print("sold it");
                        }else {
                            print("not sold");
                        }
                    }
                    return
        case "Banana":
            for (index,banana) in bananasArray.enumerated() {
                if banana.code == codeFruit {
                    bananasArray.remove(at: index);
                    print("sold it");
                        }else {
                            print("not sold");
                        }
                    }
                    return
        default:
           return print("not ") ;
        }
    }
}

"*...Created greengrocer object...*"
let greengrocer = Greengrocer.init(names: "Cecst");
print();
"*...Show fruit by category...*"
greengrocer.toStringFruitByCategoryApple();
print();
greengrocer.toStringFruitByCategoryLemon();
print();
greengrocer.toStringFruitByCategoryBanana();
print();
"*...Show tot fruit by category...*"
greengrocer.countFruitByCategory();
print();
"*...Show total fruit price...*"
greengrocer.priceTotal();
print();
"*...Sell fruit...*"
greengrocer.sell(codeFruit: 001, category: "Apple")
print();
"*...Show tot fruit by category...*"
greengrocer.countFruitByCategory();
print();
"*...Show total fruit price...*"
greengrocer.priceTotal();
