//
//  Tutorials.swift
//  Paint a Pic
//
//  Created by Samantha Gatt on 8/3/20.
//  Copyright © 2020 Samantha Gatt. All rights reserved.
//

import Foundation

struct Tutorial {
    let clues: PuzzleClues
    let instruction: String
    // animation?
}

let tutorials = [
    Tutorial(clues: .init(name: "tut-1",
                          rowClues: [[5]],
                          colClues: [[1], [1], [1], [1], [1]]),
             instruction: """
                The clues on the edges of the puzzle represent how many squares \
                should be filled in sequentially.\n
                If there is only one clue for a row or column and it is equal \
                to the total number of squares in that direction, you can fill \
                all the squares in.
                """),
    Tutorial(clues: .init(name: "tut-2",
                          rowClues: [[5], [2, 2], [1, 1, 1]],
                          colClues: [[3], [2], [1, 1], [2], [3]]),
             instruction: "")
]
