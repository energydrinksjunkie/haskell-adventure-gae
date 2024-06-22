module Types where

data Scene = Scene
    { asciiArt :: String
    , description :: String
    , options :: [(String, String)]
    } deriving (Show)