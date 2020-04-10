import UIKit

final class AppDescriptionViewController: UIViewController {
    
    // MARK: - Properties
    
    private let app: ITunesApp
    
    private let imageDownloader = ImageDownloader()
    
    private var appDescriptionView: AppDescriptionView {
        return self.view as! AppDescriptionView
    }
    
    // MARK: - Init
    
    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = AppDescriptionView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fillData()
    }
    
    // MARK: - Private
    
    private func fillData() {
        self.appDescriptionView.titleLabel.text  = "What's New"
        self.appDescriptionView.dateLabel.text = "Date of release:" + app.releaseDate!
        self.appDescriptionView.versionLabel.text = "Version of app:" + app.appVersion!
        self.appDescriptionView.descriptionLabel.text = "Description:" + app.appDescription!

    }
    
}
