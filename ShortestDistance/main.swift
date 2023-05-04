//
//  main.swift
//  ShortestDistance
//
//  Created by Nikita Batrakov on 04.05.2023.
//

import Foundation

func findDistances(_ matrix: [[Int]]) -> [[Int]] {
    let rowCount = matrix.count
    let colCount = matrix[0].count
    
    var distances = Array(repeating: Array(repeating: Int.max, count: colCount), count: rowCount)
    var queue = [(Int, Int)]()
    
    // Add all cells with value 1 to the queue with distance 0
    for i in 0..<rowCount {
        for j in 0..<colCount {
            if matrix[i][j] == 1 {
                queue.append((i, j))
                distances[i][j] = 0
            }
        }
    }
    
    // Process the queue
    while !queue.isEmpty {
        let (i, j) = queue.removeFirst()
        let distance = distances[i][j] + 1
        
        // Process neighbouring cells
        if i > 0 && distances[i - 1][j] == Int.max {
            distances[i - 1][j] = distance
            queue.append((i - 1, j))
        }
        if i < rowCount - 1 && distances[i + 1][j] == Int.max {
            distances[i + 1][j] = distance
            queue.append((i + 1, j))
        }
        if j > 0 && distances[i][j - 1] == Int.max {
            distances[i][j - 1] = distance
            queue.append((i, j - 1))
        }
        if j < colCount - 1 && distances[i][j + 1] == Int.max {
            distances[i][j + 1] = distance
            queue.append((i, j + 1))
        }
    }
    
    return distances
}
