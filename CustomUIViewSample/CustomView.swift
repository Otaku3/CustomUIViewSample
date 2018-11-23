//
//  CustomView.swift
//  CustomUIViewSample
//
//  Created by 大林拓実 on 2018/11/13.
//  Copyright © 2018年 TakumiObayashi. All rights reserved.
//

import UIKit

@IBDesignable
class CustomView: UIView {
    @IBOutlet var view: UIView!
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let selfHeight: CGFloat = 50
        let selfWidth: CGFloat = 320

        self.frame.size.height = selfHeight
        self.frame.size.width = selfWidth

        let superScreen: CGRect = (self.window?.screen.bounds)!

        self.frame.origin.x = (superScreen.width / 2) - (selfWidth / 2)
        self.frame.origin.y = (superScreen.height / 2) - (selfHeight / 2)
    }
    
    //init処理の実装（再利用可能にする）
    //コードから生成された場合の初期化
    override init(frame: CGRect) {
        super.init(frame: frame)
        nibInit()
    }

    //Storyboardから生成された場合の初期化
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        nibInit()
    }

    // xibファイルを読み込んでviewに重ねる
    fileprivate func nibInit() {
        
        let bundle = Bundle(for: CustomView.self)
        bundle.loadNibNamed("CustomView", owner: self, options: nil)
        view.frame = self.bounds
        
        self.addSubview(view)
    }
    
}
