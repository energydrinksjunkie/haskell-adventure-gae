module Main where

import Scenes
import Types (Scene, asciiArt, description, options)
import System.Console.ANSI
import System.IO

main :: IO ()
main = do
    hSetBuffering stdout NoBuffering

    startScene <- readScene "start"
    displayScene startScene

displayScene :: Scene -> IO ()
displayScene scene = do
    clearScreen
    setCursorPosition 0 0
    putStrLn (asciiArt scene)
    putStrLn ""
    putStrLn (description scene)
    putStrLn ""
    putStrLn "Opcije:"
    mapM_ (\(idx, (opt, _)) -> putStrLn (show idx ++ ". " ++ opt)) (zip [1..] (options scene))
    choice <- getChoice (length (options scene))
    let nextSceneFile = snd (options scene !! (choice - 1))
    nextScene <- readScene nextSceneFile
    displayScene nextScene

getChoice :: Int -> IO Int
getChoice numOptions = do
    putStr "Unesi izbor: "
    choiceStr <- getLine
    if null choiceStr
        then do
            putStrLn "Nevažeći izbor. Molimo pokušajte ponovo."
            getChoice numOptions
        else case reads choiceStr of
            [(choice, "")] | choice >= 1 && choice <= numOptions -> return choice
            _ -> do
                putStrLn "Nevažeći izbor. Molimo pokušajte ponovo."
                getChoice numOptions
