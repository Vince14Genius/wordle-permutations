public class Permuter {
    // count: 5
    private var greenLetters: [Character?] = [nil, nil, nil, nil, nil]
    // count for [Bool]: 5
    private var yellowLetters = [Character: [Bool]]()
    
    private let fiveFalses = [false, false, false, false, false]
    
    public init() {}
    
    /// - precondition: the added letter does not already exit
    /// - precondition: the added position does not already have a letter
    /// - precondition: the added letter does not have a yellow at the same position
    public func addGreen(letter: Character, at index: Int) {
        guard !greenLetters.contains(letter) else {
            fatalError("addGreen: the letter already exists as a green")
        }
        
        guard greenLetters[index] == nil else {
            fatalError("addGreen: a letter already exists at the index")
        }
        
        guard !(yellowLetters.contains { $0.key == letter }) else {
            fatalError("addGreen: the letter already exists as a yellow")
        }
        
        greenLetters[index] = letter
    }
    
    /// - precondition: the added letter does not have a green at the same position
    /// - precondition: the added letter will not have 5 yellow positions
    public func addYellow(letter: Character, at index: Int) {
        guard greenLetters[index] == nil else {
            fatalError("addYellow: a green letter already exists at the index")
        }
        
        var newYellows: [Bool]
        if let yellows = yellowLetters[letter] {
            newYellows = yellows
        } else {
            newYellows = fiveFalses
        }
        
        newYellows[index] = true
        
        guard !(newYellows.reduce(true) { $0 && $1 }) else {
            fatalError("addYellow: the letter will have 5 yellow positions")
        }
        
        yellowLetters[letter] = newYellows
    }
    
    public func permute() -> String {
        var permutationList: [[Character]] = [[], [], [], [], []]
        
        // add candidates
        for i in 0 ..< 5 {
            if let green = greenLetters[i] {
                permutationList[i] = [green]
                continue
            }
            
            var possibles = [Character]()
            
            possibles.append("_")
            
            for (key, value) in yellowLetters {
                if !value[i] {
                    possibles.append(key)
                }
            }
            
            permutationList[i] = possibles
        }
        
        // print permutations
        
        func permuteLayer(settled: String, index: Int) -> String {
            // base case
            
            if index >= permutationList.count {
                // check for yellow existence
                for yellow in yellowLetters.keys {
                    if !settled.contains(yellow) {
                        return "" // clear candidate
                    }
                }
                
                // return final sequence
                return settled + "\n"
            }
            
            // recursive case: empty
            
            guard !permutationList[index].isEmpty else {
                return permuteLayer(settled: settled + "_ ", index: index + 1)
            }
            
            // recursive case: non-empty
            
            var compiled = ""
            for candidate in permutationList[index] {
                compiled += permuteLayer(settled: settled + "\(candidate) ", index: index + 1)
            }
            return compiled
        }
        
        return permuteLayer(settled: "", index: 0)
    }
}
