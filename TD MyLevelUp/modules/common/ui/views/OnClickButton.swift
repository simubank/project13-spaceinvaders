//
//  OnCLickButton.swift
//
//  Copyright (c) 2017 Gopher Labs LTD
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit

/// A Convience TypeAlias to a View OnClickListener.
public typealias OnClickListener = (UIView) -> ()

/// Represents the Base UIButton for Buttons used in a Howdi Application.
open class OnClickButton: UIButton {
    public var onClickListener: OnClickListener?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        titleLabel?.font = .standard(withSize: 16.0)
        setTitleColor(.black, for: .normal)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        addTarget(self, action:#selector(self.handleClick(_:)), for: .touchUpInside)
    }
    
    @objc open func handleClick(_ button: UIButton){
        guard let onClickListener = onClickListener else { return }
        onClickListener(button)
    }
}
