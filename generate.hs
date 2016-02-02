import Data.Char
import Data.List
import Text.Printf
import System.IO
import System.Random

-- an extremely annotated attempt @ words

-- map takes a function (that takes a and returns b), [a], and returns [b]
myMap :: (a->b) -> [a] -> [b]
myMap _ [] = []
myMap f (x:xs) = f x : myMap f xs

-- : is cons operator, appends a head element to a list, x onto xs
-- (x:xs) is a pattern for nonempty lists
-- _ matches anything without binding, f matches anything with binding?
-- base case is empty list
-- recursive case is match first list element x, return (f x): map f xs
-- map f [x1, x2, ... ] == [f x1, f x2, ...]
-- recursion, pattern matching, partial function application + currying
-- mapM :: (a -> IO b) -> [a] -> IO [b]

--buildParagraph :: [String] -> IO String -> [String] -> IO [String]
--buildParagraph ws = replicate 10 randomWord(ws)

randomWord :: [String] -> IO String
randomWord words = do
  let wordcount = length(words)
  randomIndex <- randomRIO(0, wordcount - 1)
  return (words !! randomIndex)

lowercase :: String -> String
lowercase = map toLower

removePunctuation :: [String] -> [String]
removePunctuation = map (filter isAlpha)

main :: IO String
main = do g <- newStdGen
  content <- readFile "subjective.txt"
  let list = removePunctuation(words (lowercase (content)))
  --let randomWords = mapM randomWord [1..10]
  --print randomWord
  --buildParagraph(list)
  print (randomList (0, length(list)) 5 g :: [Integer]))