import Data.Char
import Data.List
import Text.Printf
import System.IO

lowercase :: String -> String
lowercase = map toLower

removePunctuation :: [String] -> [String]
removePunctuation = map (filter isAlpha)

main = do 
    content <- readFile "subjective.txt"
    let list = removePunctuation(words (lowercase (content)))
    
    print list