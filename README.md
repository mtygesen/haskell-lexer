# Example Lexer in Haskell 

### Requires
- GHC
- Alex

### Compile Lexer Definition
```bash
alex Lexer.x -g
```

### Compile Haskell Source
```bash
ghc Lexer.hs -O2
```

### Use on example.lang
```bash
./Lexer example.lang
```

### Generate DFA Information
```bash
alex Lexer.x -i
```
This will generate a .info file with information about states and transitions