//
//  VisualEffectView+Public.swift
//  Blurberry
//
//  Created by Pavel Puzyrev on 09.09.2020.
//
//  Copyright (c) 2020 Pavel Puzyrev <cannedapp@yahoo.com>
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

import UIKit

public extension BlurWrapper where Base: UIVisualEffectView {

    var radius: CGFloat {
        get {
            gaussianBlurFilter?.dictionaryValue(getter: "requestedValues")?["inputRadius"] as? CGFloat ?? 0.0
        }
        set {
            prepareForChanges()
            gaussianBlurFilter?.setObjectInDictionary(object: newValue, key: "inputRadius", getter: "requestedValues")
            applyChanges()
        }
    }

    var tintColor: UIColor? {
        get {
            sourceOverEffect?.colorValue(getter: "color")
        }
        set {
            prepareForChanges()
            sourceOverEffect?.setValueUsingSetter(value: newValue, getter: "color")
            sourceOverEffect?.callMethod(named: "applyRequestedEffectToView:", with: overlayView)
            applyChanges()
        }
    }
}
