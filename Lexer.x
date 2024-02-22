{
module Main (main) where
import System.Environment (getArgs)
}

%wrapper "basic"

$digit = 0-9            -- digits
$alpha = [a-zA-Z]       -- alphabetic characters

tokens :-
    $white+                        ;
    "#".*                          ;
    "if"                           { \_ -> If }
    "else"                         { \_ -> Else }
    "print"                        { \_ -> Print }
    "="                            { \_ -> Define }
    "->"                           { \_ -> Arrow }
    "=>"                           { \_ -> ConstraintArrow }
    ":"                            { \_ -> Cons }
    "=="                           { \_ -> Equal }
    "("                            { \_ -> LParen }
    ")"                            { \_ -> RParen }
    "["                            { \_ -> LSquare }
    "]"                            { \_ -> RSquare }
    ";"                            { \_ -> Semicolon }
    ","                            { \_ -> Comma }
    "_"                            { \_ -> Wildcard }
    $digit+                        { \s -> Integer (read s) }
    $alpha [$alpha $digit \_ \']*  { \s -> Identifier s }

{
data Token
    -- Keywords
    = If
    | Else
    | Print

    -- Operators
    | Define
    | Arrow
    | ConstraintArrow
    | Cons
    | Equal

    -- Symbols
    | LParen
    | RParen
    | LSquare
    | RSquare
    | Semicolon
    | Comma

    -- Literals
    | Wildcard
    | Identifier String
    | Integer Int

    deriving (Eq, Show)

main = do
    args <- getArgs
    let filename = head args
    s <- readFile filename
    print (alexScanTokens s)
}