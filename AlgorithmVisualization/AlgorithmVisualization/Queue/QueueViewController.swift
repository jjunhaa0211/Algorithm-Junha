import UIKit
import SnapKit
import Then
import JunhaAlgorithm

class QueueViewController: UIViewController {
    private var queue: QueueArray<Int> = QueueArray()
    private let tableView = UITableView().then {
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
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
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Enqueue", style: .plain, target: self, action: #selector(enqueueButtonTapped))
        navigationItem.leftBarButtonItems = [UIBarButtonItem(title: "Dequeue", style: .plain, target: self, action: #selector(dequeueButtonTapped)),
            UIBarButtonItem(title: "Peek", style: .plain, target: self, action: #selector(peekButtonTapped))]
    }
    
    private func updateTableView() {
        tableView.reloadData()
    }
    
    @objc private func enqueueButtonTapped() {
        let newValue = Int.random(in: 1...100)
        queue.enqueue(newValue)
        updateTableView()
    }
    
    @objc private func dequeueButtonTapped() {
        if let value = queue.dequeue() {
            showAlert(message: "\(value)가 dequeued 되었습니다.")
            updateTableView()
        } else {
            showAlert(message: "Queue가 비어있습니다.")
        }
    }
    
    @objc private func peekButtonTapped() {
        if let value = queue.peek {
            showAlert(message: "Queue의 맨 위: \(value)")
        } else {
            showAlert(message: "Queue이 비어 있습니다")
        }
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert).then {
            $0.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        }
        present(alert, animated: true, completion: nil)
    }
}

extension QueueViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return queue.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let queueArray = queue.toArray()
        if indexPath.row < queueArray.count {
            let value = queueArray[indexPath.row]
            cell.textLabel?.text = "\(value)"
        }
        return cell
    }
}
