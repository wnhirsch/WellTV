//
//  CodeView.swift
//  WellTV
//
//  Created by Wellington Nascente Hirsch on 16/05/22.
//

public protocol CodeView {

    func buildViewHierarchy()
    func setupConstraints()
    func setupAdditionalConfiguration()
    func setupView()

}

public extension CodeView {

    func setupView() {
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }

}
