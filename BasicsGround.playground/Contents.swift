//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var array = [2,3,4]

for (index, value) in array.enumerated(){
    array[index] = 2
}
print(array)
