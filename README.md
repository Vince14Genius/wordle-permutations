# wordle-permutations
For tryharding Wordle without cheating | Swift PlaygroundBook

I used to brute-force all possible combinations by hand when both *enough green/yellow letters are uncovered* and *I still have no idea what's going on*. Then I decided to write some code to automate this process.

## Usage

> **Important:** [Swift Playgrounds](https://www.apple.com/swift/playgrounds/) is required to run this PlaygroundBook

### Initial Setup

Create an instance of `Permuter` with its only initializer (no arguments)

### Adding Letters

- Use `.addGreen(letter:at:)` to add a letter marked green

- Use `.addYellow(letter:at:)` to add a letter marked yellow

> **Important:** the `at:` parameter is indexed from 0, not 1

> **Note:** errors will be thrown when the letters you add conflict with each other logically

### Run Permutations

`.permute()` returns the result `String`

## Sample Output

Setup code:

```
// overall: 🟨⬛🟩🟨⬛
// I: ⬛⬛🟨🟨⬛
// T: 🟨⬛⬛⬛⬛
// R: ⬛⬛🟩⬛⬛
let permuter = Permuter()
permuter.addYellow(letter: "I", at: 2)
permuter.addYellow(letter: "I", at: 3)
permuter.addYellow(letter: "T", at: 0)
permuter.addGreen(letter: "R", at: 2)
print(permuter.permute())
```

Output:

```
_ _ R T I 
_ T R _ I 
_ T R T I 
_ I R _ T 
_ I R T _ 
_ I R T T 
_ I R T I 
I _ R _ T 
I _ R T _ 
I _ R T T 
I _ R T I 
I T R _ _ 
I T R _ T 
I T R _ I 
I T R T _ 
I T R T T 
I T R T I 
I I R _ T 
I I R T _ 
I I R T T 
I I R T I 
```

## Future development

New features may or may not be added in the future.
