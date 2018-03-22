module Easycode where

import qualified Data.Map.Strict as Map

l = [("1","a"), ("2","b"), ("3","c"), ("4","d"), ("5","e"), ("6","f"), ("7","g"), ("8","h"), ("9","i"), ("10","j"), ("11","k"), ("12","l"), ("13","o"), ("14","m"), ("15","y"), ("16","z")]

dic = Map.fromList l
revDic = Map.fromList (map (\t -> (snd t, fst t)) l)

fromCode :: String -> String
fromCode "" = ""
fromCode (c:s) = case c of
                 '(' -> insideParens s
                 otherwise ->  (translateFromChar c) ++ (fromCode s)

insideParens s = (fromCodePar (takeWhile (/=')') s)) ++ (fromCode (afterParens s))

afterParens :: String -> String
afterParens s = tail . dropWhile (/=')') $ s

translateFromChar :: Char -> String
translateFromChar c = case (dic Map.!? [c]) of
                        Just value -> value
                        Nothing -> [c]

fromCodePar :: String -> String
fromCodePar s = case (dic Map.!? s) of
                  Just value -> value
                  Nothing -> s

toCode :: String -> String
toCode "" = ""
toCode (c:s) = (toCodeChar c) ++ (toCode s)

toCodeChar :: Char -> String
toCodeChar c = case (revDic Map.!? [c]) of
                 Just value -> if (length value) > 1 then "(" ++ value ++ ")" else value
                 Nothing -> [c]
