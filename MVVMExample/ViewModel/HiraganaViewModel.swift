//
//  HiraganaViewModel.swift
//  MVVMExample
//
//  Created by Rudi on 2/1/18.
//  Copyright © 2018 SakuraDev. All rights reserved.
//

import Foundation
// This struct models a single Hiragana character. (Yes, my purist Japanese learning friends, I know it's not really a "character", put your nail bats down)
struct Hiragana {
    let id: String
    let character: String
    let romanji: String
}

// This state struct will model the view's state for us. The state can consist of several models.
struct HiraganaViewModelState {
    var hiragana = [Hiragana]()
    var selectedHiragana: Hiragana?
}

class HiraganaViewModel {
    
    // We will keep a reference to the function we will call when we update the state.
    private var updateView: (HiraganaViewModelState) -> ()
    
    // We store the state here, and every time the state changes from anywhere in the view model, the didSet will update the view.
    private var state = HiraganaViewModelState(hiragana: HiraganaDataLayer.getSampleHiragana(), selectedHiragana: nil) {
        didSet {
            updateView(state)
        }
    }
    
    // We initialize the view model here, and store a reference to the update view function in the view model. We then call the update function to give it the inital value.
    init(updateView: @escaping (HiraganaViewModelState) -> ()) {
        self.updateView = updateView
        updateView(state)
    }
    
    // The ViewController might call this at some point, for example, because the user has tapped on a TableView cell, and we then want to show the detail view for that cell.
    func setSelectedHiragana(id: String) {
        state.selectedHiragana = state.hiragana.first(where: { $0.id == id })
    }
}

// This is just a helper struct. We don't want to implement "real" data storage and retrieval at this time.
struct HiraganaDataLayer {
    static func getSampleHiragana() -> [Hiragana] {
        return [Hiragana(id: "1", character: "あ", romanji:"a"),
                Hiragana(id: "2", character: "い", romanji:"i"),
                Hiragana(id: "3", character: "え", romanji:"e"),
                Hiragana(id: "4", character: "お", romanji:"o")]
    }
}
