module Util exposing (formattedNumber, spaceFilter)

spaceFilter : String -> String
spaceFilter string =
  String.filter (\char -> char /= ' ') string

formattedNumber : String -> String
formattedNumber base =
  let
    number = spaceFilter base
    firstNum = String.slice 0 3 number
    secondNum = String.slice 3 6 number
    thirdNum = String.slice 6 10 number
    firstPart = "(" ++ firstNum ++ ")"
    secondPart = firstPart ++ " " ++ secondNum
    thirdPart = secondPart ++ "-" ++ thirdNum
  in
  if firstNum == "" then
    ""
  else if secondNum == "" then
    firstPart
  else if thirdNum == "" then
    secondPart
  else
    thirdPart