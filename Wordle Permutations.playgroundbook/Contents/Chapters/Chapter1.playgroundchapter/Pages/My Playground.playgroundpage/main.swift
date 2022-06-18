// For trying out permutations in Wordle after
// several letters / banned locations are known

let permuter = Permuter()
permuter.addYellow(letter: "I", at: 2)
permuter.addYellow(letter: "I", at: 3)
permuter.addYellow(letter: "T", at: 0)
permuter.addGreen(letter: "R", at: 2)
print(permuter.permute())
