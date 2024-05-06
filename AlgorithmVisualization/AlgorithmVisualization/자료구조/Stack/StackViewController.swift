import UIKit
import SnapKit
import Then
import JunhaAlgorithm

class StackViewController: UIViewController {
    private var stack: Stack<Int> = Stack()
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
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Push", style: .plain, target: self, action: #selector(pushButtonTapped))
        navigationItem.leftBarButtonItems = [
            UIBarButtonItem(title: "Peek", style: .plain, target: self, action: #selector(peekButtonTapped)),
            UIBarButtonItem(title: "Pop", style: .plain, target: self, action: #selector(popButtonTapped))
        ]
    }
    
    private func updateTableView() {
        tableView.reloadData()
    }
    
    @objc private func pushButtonTapped() {
        let newValue = Int.random(in: 1...100)
        stack.push(newValue)
        updateTableView()
    }
    
    @objc private func peekButtonTapped() {
        if let value = stack.peek() {
            showAlert(message: "Stack의 맨 위: \(value)")
        } else {
            showAlert(message: "Stack이 비어 있습니다")
        }
    }

    @objc private func popButtonTapped() {
        if let value = stack.pop() {
            showAlert(message: "\(value)이 Stack에서 pop되었습니다")
            updateTableView()
        } else {
            showAlert(message: "스택이 비어 있습니다")
        }
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert).then {
            $0.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

        }
        present(alert, animated: true, completion: nil)
    }
}

extension StackViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stack.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let index = stack.count - indexPath.row - 1
        if let value = stack.item(at: index) {
            cell.textLabel?.text = "\(value)"
        }
        return cell
    }
}
