# Example Lexer in Haskell 

### Requires
- GHC
- Alex
### Compile 

```bash
alex Lexer.x -g && ghc Lexer.hs -O2
```

### Use on example.lang
```bash
./Lexer example.lang
```

### Generate DFA information
```bash
alex Lexer.x -i
```
This will generate a .info file with information about states and transitions