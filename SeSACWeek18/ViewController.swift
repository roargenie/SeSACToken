//
//  ViewController.swift
//  SeSACWeek18
//
//  Created by 이명진 on 2022/11/02.
//

import UIKit
import RxSwift

final class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    let viewModel = ProfileViewModel()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.profile // <Single>에 대한 내용 살펴보기
            .withUnretained(self)
            .subscribe { (vc, value) in
                vc.label.text = value.user.username
            } onError: { error in
                print(error.localizedDescription)
            }
            .disposed(by: disposeBag)
        
        // subscribe, bind, drive
        // driver VS signal
        
        viewModel.getProfile()
        checkCOW()
    }
    
    func checkCOW() {
        var test = "jack"
        address(&test) // inout
        
        var test2 = test
        address(&test2)
        
        test2 = "sesac"
        address(&test)
        address(&test2)
        
        print("===========================")
        
        var array = Array(repeating: "A", count: 100)
        // Array, Dictionary, Set == Collection은 Copy On Write특성을 지님.
        address(&array)
        
        var newArray = array // 실제로 복사 안함. 원본을 공유하고 있음.
        address(&newArray)
        
        newArray[0] = "B"
        
        address(&array)
        address(&newArray)
        
    }
    
    func address(_ value: UnsafeRawPointer) {
        let address = String(format: "%p", Int(bitPattern: value))
        print(address)
    }
    
    
}

