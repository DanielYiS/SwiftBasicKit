
import UIKit
import ESPullToRefresh

public class ZBaseTV: UITableView {
    
    public var onRefreshHeader: (() -> Void)?
    public var onRefreshFooter: (() -> Void)?
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    public required convenience init(frame: CGRect) {
        self.init(frame: frame, style: UITableView.Style.plain)
    }
    public override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        self.setupViewUI()
    }
    deinit {
        self.es.removeRefreshHeader()
        self.es.removeRefreshFooter()
    }
    private func setupViewUI() {
        if #available(iOS 11.0, *) {
            self.contentInsetAdjustmentBehavior = UIScrollView.ContentInsetAdjustmentBehavior.never
        }
        self.estimatedSectionFooterHeight = 0
        self.estimatedSectionHeaderHeight = 0
        self.estimatedRowHeight = UITableView.automaticDimension
        self.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        self.separatorColor = .clear
        
        self.isUserInteractionEnabled = true
        self.backgroundColor = .clear
        
        self.bgView.addSubview(lbError)
        self.bgView.addSubview(aiView)
        self.lbError.frame = CGRect.init(70.scale, self.frame.size.height/2, 238.scale, 40)
        self.aiView.frame = CGRect.init(self.frame.size.width/2 - 15, self.frame.size.height/2 - 15, 30, 30)
        self.bgView.frame = self.bounds
        self.backgroundView = self.bgView
        self.backgroundView?.frame = self.bounds
    }
    public func addRefreshHeader() {
        self.es.addPullToRefresh { [unowned self] in
            self.onRefreshHeader?()
        }
    }
    public func addRefreshFooter() {
        self.es.addInfiniteScrolling { [unowned self] in
            self.onRefreshFooter?()
        }
        self.es.base.footer?.isHidden = true
    }
    public  func endRefreshHeader(_ count: Int = 0) {
        if count < kPageCount {
            self.es.stopPullToRefresh(ignoreFooter: true)
        } else {
            self.es.stopPullToRefresh(ignoreFooter: false)
        }
    }
    public func endRefreshFooter() {
        self.es.stopLoadingMore()
    }
    public func endRefreshFooter(_ count: Int) {
        self.es.stopLoadingMore()
        if count < kPageCount {
            self.es.noticeNoMoreData()
        }
    }
}
