//
//  Copyright (c) 2019 Manav Rathi.
//
//  MIT License.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController {
    private var refreshButton: UIButton?
    private var activityIndicatorView: UIActivityIndicatorView?
    private var resultsLabel: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()

        let button = UIButton(type: .system)
        self.refreshButton = button
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("↻", for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .title1)
        button.addTarget(self, action: #selector(refresh), for: .touchUpInside)

        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
    }

    @objc private func refresh() {
        NSLog("Refresh")
    }
}

extension TodayViewController: NCWidgetProviding {
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
}
