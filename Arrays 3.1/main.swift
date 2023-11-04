//
//  main.swift
//  Arrays 3.1
//
//  Created by User on 02.11.2023.
//

import Foundation

// Создайте 10 строк с названиями стран. Создайте массив.
let countres = ["Canada","Japan","Russia","Africa","France","USA","Australia","Germany","Shwiden","China"]
var newCountres:[String] = []

//Проверьте строки: если в строке более 5 символов — добавить её в массив. Но если строка содержит букву А - заменить эту букву на другую и добавить изменённую строку в массив.

for contry in countres {
    if contry.count > 5 {
        let newArray = contry.replacingOccurrences(of: "X", with: "A")
        newCountres.append(newArray)
        
    }else{
        print("Страна больше 5 символов")
    }
}
print(newCountres)

//Создайте массив из 20-30 значений любого типа. Сделайте линейную сортировку

var randomArray = [213,3,12,55,333,78,4,9,11,345,8,1,2,44,663,6,13,15,19,29]
randomArray.sort()
print(randomArray)

//сортировка пузырьком

var numbersOne = [ 41, 1 , 5 , 13, 10]

for i in 0..<numbersOne.count{
    let index = (numbersOne.count - 1 ) - i
    
    for j in 0..<index{
        
        let number = numbersOne[j]
        
        let nextNumber = numbersOne[ j + 1 ]
        
        if number > nextNumber {
          numbersOne[j] = nextNumber
          numbersOne[j + 1 ] = number
            
        }
        
    }
     
}
print(numbersOne)

//Сделайте быструю сортировку


let items = [12, 23, 4, 5, 19, 299, 25,8,54,77]
let sortedd =  quickSorted(items)

print(sortedd)


func quickSorted(_ items: [Int]) -> [Int] {
    
    guard items.count > 1
    else{
        return items
    }
    let median = items[ items.count/2]
    let less = items.filter {$0 < median}
    let equal = items.filter {$0 == median}
    let greater = items.filter{ $0 > median}
    
    return quickSorted(less) + equal + quickSorted(greater)
}

//5) Сделайте bubble sort немного быстрее — создайте алгоритм «шейкерной» сортировки, или коктейльный алгоритм.

func cocktailSort(_ array: inout [Int]) {
    var start = 0
    var end = array.count - 1
    var swapped = true
    
    while swapped {
        swapped = false
        
        for i in start..<end {
            if array[i] > array[i + 1] {
                array.swapAt(i, i + 1)
                swapped = true
            }
        }
        
        if !swapped {
            break
        }
        
        swapped = false
        end -= 1
        
        for i in stride(from: end - 1, through: start, by: -1) {
            if array[i] > array[i + 1] {
                array.swapAt(i, i + 1)
                swapped = true
            }
        }
        
        start += 1
    }
}

var numbers = [5, 1, 3, 9, 2, 6]
cocktailSort(&numbers)
print(numbers)



//чет-нечет сортировка
func evenOddSort(_ array: inout [Int]) {
    let count = array.count
    var sorted = false
    
    while !sorted {
        sorted = true
        
        for i in stride(from: 1, to: count - 1, by: 2) {
            if array[i] > array[i + 1] {
                array.swapAt(i, i + 1)
                sorted = false
            }
        }
        
        for i in stride(from: 0, to: count - 1, by: 2) {
            if array[i] > array[i + 1] {
                array.swapAt(i, i + 1)
                sorted = false
            }
        }
    }
}

var numbersTwo = [5,6,99,23,12,4]
evenOddSort(&numbersTwo)
print(numbersTwo)
