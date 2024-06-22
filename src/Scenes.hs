module Scenes where

import Types
import Data.Char (isSpace)
import Data.List (isPrefixOf, tails)
import Data.List.Split (splitOn)

readScene :: FilePath -> IO Scene
readScene filePath = do
    let realPath = "src/scenes/"++filePath++".txt"
    contents <- readFile realPath
    let [art, desc, optsStr] = splitOn "\n\n" contents
    let optionsList = map parseOption (lines optsStr)
    return Scene { asciiArt = art, description = desc, options = optionsList }

parseOption :: String -> (String, String)
parseOption optionStr =
    let [option, sceneFile] = splitOn " -> " optionStr
    in (trim option, trim sceneFile)

trim :: String -> String
trim = f . f
  where f = reverse . dropWhile isSpace