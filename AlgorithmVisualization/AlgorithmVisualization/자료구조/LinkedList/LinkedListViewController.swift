import UIKit
import SnapKit
import Then
import JunhaAlgorithm

class LinkedListViewController: UIViewController {
    private var linkedList = LinkedList<Int>()
    private let tableView = UITableView().then {
        $0.register(LinkedListCell.self, forCellReuseIdentifier: "LinkedListCell")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupNavigationBar()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        tableView.dataSource = self
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setupNavigationBar() {
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(title: "add", style: .plain, target: self, action: #selector(appendButtonTapped)),
            UIBarButtonItem(title: "insert", style: .plain, target: self, action: #selector(insertButtonTapped))
            ,
            UIBarButtonItem(title: "search", style: .plain, target: self, action: #selector(searchButtonTapped))
        ]
        navigationItem.leftBarButtonItems = [
            UIBarButtonItem(title: "RLast", style: .plain, target: self, action: #selector(removeLastButtonTapped)),
            UIBarButtonItem(title: "RAll", style: .plain, target: self, action: #selector(removeAllButtonTapped)),
            UIBarButtonItem(title: "Size", style: .plain, target: self, action: #selector(sizeButtonTapped))
        ]
    }
    
    private func updateTableView() {
        tableView.reloadData()
    }
    
    @objc private func appendButtonTapped() {
        let newValue = Int.random(in: 1...100)
        linkedList.append(newValue)
        updateTableView()
    }
    
    @objc private func removeLastButtonTapped() {
        linkedList.removeLast()
        updateTableView()
    }
    
    @objc private func removeAllButtonTapped() {
        linkedList.removeAll()
        updateTableView()
    }
    
    // 세번째 인덱스에 4를 추가합니다.
    @objc private func insertButtonTapped() {
        linkedList.insert(4, at: 3)
        updateTableView()
    }
    
    //인덱스 4를 찾습니다.
    @objc private func searchButtonTapped() {
        print("노드 4를 찾는 함수가 실행되었습니다.")
        let searchValue = 4
        if let _ = linkedList.searchNode(with: searchValue) {
            print("노드를 찾았습니다: \(searchValue)")
        } else {
            print("\(searchValue) 값을 가진 노드를 찾지 못했습니다.")
        }
        updateTableView()
    }
    
    @objc private func sizeButtonTapped() {
        let listSize = linkedList.size()

        print("LinkedList의 크기는 \(listSize)입니다.")
        updateTableView()
    }
}

extension LinkedListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return linkedList.size()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LinkedListCell", for: indexPath) as! LinkedListCell
        let currentNode = linkedList.getNode(at: indexPath.row)
        let nextNode = linkedList.getNode(at: indexPath.row + 1)
        
        if indexPath.row == linkedList.size() - 1 {
            cell.configure(with: currentNode?.data, nextValue: nil)
        } else {
            cell.configure(with: currentNode?.data, nextValue: nextNode?.data)
        }
        
        return cell
    }
}

class LinkedListCell: UITableViewCell {
    private let valueLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16)
    }
    private let arrowImageView = UIImageView().then {
        $0.image = UIImage(systemName: "arrow.right")
        $0.tintColor = .gray
    }
    private let nilLabel = UILabel().then {
        $0.text = "nil"
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = .gray
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {

        contentView.addSubview(valueLabel)
        contentView.addSubview(arrowImageView)
        contentView.addSubview(nilLabel)

        valueLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().offset(16)
        }

        arrowImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalTo(valueLabel.snp.right).offset(8)
        }
        
        nilLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalTo(arrowImageView.snp.right).offset(8)
            $0.right.lessThanOrEqualToSuperview().offset(-16)
        }
    }
    
    func configure(with value: Int?, nextValue: Int?) {
        if let value = value {
            valueLabel.text = "\(value)"
        } else {
            valueLabel.text = "nil"
        }

        if let nextValue = nextValue {
            arrowImageView.isHidden = false
            nilLabel.text = "\(nextValue)"
        } else {
            arrowImageView.isHidden = true
            nilLabel.text = "nil"
        }
    }
}

// 이해를 위한 print문 추가 버전
extension LinkedList {
    /// LinkViewController 전용
    func searchNode(with value: T) -> Node<T>? {
        var current = head
        var index = 0
        while let currentNode = current {
            print("인덱스 \(index)에서 값을 검색 중: 현재 값은 \(String(describing: currentNode.data))입니다.")
            if currentNode.data == value {
                print("값 \(value)를 인덱스 \(index)에서 발견했습니다.")
                return currentNode
            }
            current = currentNode.next
            index += 1
        }
        print("값 \(value)를 리스트에서 찾을 수 없습니다.")
        return nil
    }
    
    mutating public func insert(_ data: T, at index: Int) {
        if head == nil {
            head = Node(data: data)
            print("새로운 노드가 헤드로 삽입됨: \(data)")
            return
        }

        if index == 0 {
            let newNode = Node(data: data)
            newNode.next = head
            head = newNode
            print("인덱스 0에 새로운 노드 삽입: \(data)")
            return
        }

        var node = head
        var currentIndex = 0

        while currentIndex < index - 1 && node != nil {
            node = node?.next
            currentIndex += 1
            print("현재 노드(\(currentIndex))가 가리키는 노드: \(String(describing: node?.data))")
        }

        if currentIndex == index - 1 && node != nil {
            let newNode = Node(data: data)
            newNode.next = node?.next
            node?.next = newNode
            print("\(index)번 인덱스에 새로운 노드 삽입: \(data), 다음 노드: \(String(describing: newNode.next?.data))")
        } else {
            print("주어진 인덱스가 리스트의 범위를 초과하여 마지막에 새 노드 삽입: \(data)")
        }
    }

}
