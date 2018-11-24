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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchedBegan")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touchEvent = touches.first!
        
        //元座標の取得
        let preX = touchEvent.previousLocation(in: self.view).x
        let preY = touchEvent.previousLocation(in: self.view).y
        
        //移動後座標の取得
        let newX = touchEvent.location(in: self.view).x
        let newY = touchEvent.location(in: self.view).y
        
        //座標差分計算
        let dx = newX - preX
        let dy = newY - preY
        
        //差分反映
        self.view.frame.origin.x += dx
        self.view.frame.origin.y += dy
        print("dx:\(dx),dy:\(dy)")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesEnded")
    }
    
}
