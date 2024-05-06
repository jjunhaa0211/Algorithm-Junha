# Array

> Array(배열) - 멤버가 순서를 가진 리스트 형태의 컬렉션 타입
> 

💡 참고로 배열의 값은 옵셔널이다

```
//정식 문법
let numbers: Array<Int> = [2, 4, 6, 8]

//축약형
let numbers: [Int] = [2, 4, 6, 8]

```

원래는 `Array` 이런 식으로 적는데 보통의 사람 들어 축약형을 더욱 선호합니다

그리고 우리의 Swift는 타입 명시를 하지 않아도 자동으로 타입 유추를 하기 때문에 굳이 타입을 안 정해줘도 됩니다(하지만 가능한이면 적어주는 버릇을 들이는 것이 좋습니다)

```
//배열을 추가 하고 싶다면?
numbers.append(10) //출력 = [2, 4, 6, 8, 10]

numbers += [12, 14, 16] //[2, 4, 6, 8, 10, 12, 14, 16]

```

배열을 추가하고 싶으면 `append`를 사용하여서 하나하나씩 추가해주는 방법이 있습니다, 그리고 추가 한 배열은 자동으로 뒤에 추가됩니다

또는 여러 가지 배열값을 추가해주고 싶으면`+=` 을 사용해지면 간결해집니다.

```
//만약 값을 알고 싶다면?
firstItme = numberItem[0] //첫 번째 아이템
print(firstItme)

numbers.contains(2) // true

```

자신이 정한 변수 뒤에 \[\]를 붙이고 찾고 싶은 값을 쓰면 인덱스 값을 출력할 수 있다

`contains`를 사용하여서 내용물을 확인할 수도 있다, 참고로 `contains`는 Bool이라서 `true`, `false`로 표현한다

```
//배열의 값을 삭제 및 수정하고 싶다면?
let firstItem = numbers.first // 초반에 옵셔널이 없을 수 있음 // 출력 = Optional(2)
let lastItem = numbers.last // 초반에 옵셔널이 없을 수 있음 // 출력 = Optional(16)

numbers.min() // Optional(2)
numbers.max() // Optional(16)

numbers.insert(0, at: 1) //0번째 인덱스가 2에서 1로 바뀜

numbers.removeAll() //모든 것을 없에 버림

numbers.remove(at: 0) //0번째 값이 사라지고 다시 재정렬됨

```

`min`를 사용해서 최솟값을 찾을 수 있고

`max`를 사용해서 최댓값을 찾을 수 있고

`insert`를 사용해서 (`인덱스`, at: `원하는 값`)을 넣어서 값을 바꿀 수 있다

`removeAll을` 사용하여서 전부 초기화시켜줄 수도 있고

`remove를` 사용하여서 원하는 `index` 값만 삭제할 수 있다

```
//비어있는지 확인하고 싶으면?
let isEmpty = numbers.isEmpty

```

`isEmpty를` 사용하여서 값이 있는지 없는지를 확인할 수 있다 `isEmpty`는 bool 형태라서 `true`, `false`로 표현한다

```
//몇개인지 확인하고 싶다면?
numbers.count // 출력 = 8

```

`count`를 사용하여서 개수를 확인할 수 있다.

```
//값의 순서를 바꾸고 싶다면?
numbers.swapAt(0, 15)

```

`swapAt`을 사용하면 원하는 `index`의 값을 두 개의 `index를` 바꿀 수 있다

```
//값을 순간 다르게 하고 싶다면?
numbers.dropFist(3)
numbers.prefix(4)

```

`dropFist를` 사용하면 앞에 3개를 없애지만 실제로는 제거하지 않음

`prefix를` 사용하면 앞에 3개만 가져오고 실제로는 제거되지 않음