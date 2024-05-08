/*
 임의의 N개의 숫자가 입력으로 주어집니다.
 N개의 수를 오름차순으로 정렬한 다음 N개의 수 중 한 개의 수인 M이 주어지면 이분 검색으로 M이 정렬된 상태에서 몇번째에 있는지 구하는 프로그램을 작성하세요.
 단 중복값은 존재하지 않습니다.
 
 입력설명
 - 첫 줄에 한 줄에 자연수 N(3<=N<=1,000,000)과 M이 주어집니다.
 - 두 번째 줄에 N개의 수가 공백을 사이에 두고 주어집니다.
 
 출력 설명
 - 첫 줄에 정렬 후 M의 값의 위치 번호를 출력합니다.
 
 입력 예제1
 8 32
 23 87 65 12 57 32 99 81
 
 출력 예제1
 3
 */


import Foundation

func binarySearch(array: [Int], num: Int) -> Int? {
    var left = 0
    var right = array.count - 1
    
    while left <= right {
        let mid = left + (right - left) / 2
        
        if array[mid] == num {
            return mid
        } else if array[mid] < num {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    
    return nil
}

func findPositionAfterSortingAndBinarySearch(M: Int, numbers: [Int]) -> Int? {
    let sortedNumbers = numbers.sorted()
    
    if let index = binarySearch(array: sortedNumbers, num: M) {
        return index + 1
    } else {
        return nil
    }
}

func processInputAndOutput() {
    let inputs1 = readLine()!.split(separator: " ").map { Int($0) }
    let inputs2 = readLine()!.split(separator: " ").map { Int($0) }
    
    let numbers = inputs2.compactMap { $0 }
    
    if let position = findPositionAfterSortingAndBinarySearch(M: inputs1.last!!, numbers: numbers) {
        print(position)
    } else {
        print("position 에러")
    }
}

processInputAndOutput()
