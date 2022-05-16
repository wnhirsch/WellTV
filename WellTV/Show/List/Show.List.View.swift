//
//  Show.List.View.swift
//  WellTV
//
//  Created by Wellington Nascente Hirsch on 16/05/22.
//

import UIKit
import SnapKit

extension Scene.Show.List {
    
    class View: UIView, CodeView {
        
        let tableView = UITableView()
        
        private let searchField: UITextField = {
            let textField = UITextField()
            textField.placeholder = "Enter text here"
            textField.font = UIFont.systemFont(ofSize: 15)
            textField.borderStyle = UITextField.BorderStyle.roundedRect
            textField.autocorrectionType = UITextAutocorrectionType.no
            textField.keyboardType = UIKeyboardType.default
            textField.returnKeyType = UIReturnKeyType.done
            textField.clearButtonMode = UITextField.ViewMode.whileEditing
            textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
            return textField
        }()
        
        init() {
            super.init(frame: .zero)
            setupView()
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func buildViewHierarchy() {
            addSubview(searchField)
            addSubview(tableView)
        }
        
        func setupConstraints() {
            searchField.snp.makeConstraints{ (make) -> Void in
                make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
                make.horizontalEdges.equalToSuperview().inset(16)
            }
            
            tableView.snp.makeConstraints{ (make) -> Void in
                make.top.equalTo(searchField.snp.bottom)
                make.horizontalEdges.equalToSuperview()
                make.bottom.equalToSuperview()
            }
        }
        
        func setupAdditionalConfiguration() {
            backgroundColor = .systemBackground
            tableView.backgroundColor = .clear
            tableView.register(Cell.self)
        }
        
    }
    
}


