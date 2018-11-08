module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (placeholder, class, id, type_, checked, name)
import Html.Events exposing (onInput, onClick)
import Util exposing (formattedNumber, spaceFilter)

-- Program
main : Program () Model Msg
main = Browser.sandbox { 
  init = init
  , view = view
  , update = update
  }

-- Model
type alias Model = { 
  title : String
  , phone_number : String
  , description : String
  , color : String
  }

init : Model
init = { 
  title = "Derp Derpington"
  , phone_number = "(555) 555-5555"
  , description = "Attorney at Law."
  , color = "is-dark" 
  }
  
-- Update
type Msg 
  = UpdateTitle String 
  | UpdateDescription String
  | UpdatePhoneNum String
  | UpdateColor String

update : Msg -> Model -> Model
update msg model =
  case msg of
    UpdateTitle title ->
      { model | title = title }
    UpdateDescription description ->
      { model | description = description }
    UpdatePhoneNum number ->
      { model | phone_number = formattedNumber number }
    UpdateColor color ->
      { model | color = color }

-- View
heroPane : Model -> Html Msg
heroPane model = 
  div [ id "title", class ("hero is-centered is-bold " ++ model.color) ]
  [
    h1[ class "has-text-centered title is-1" ] [ text model.title ]
    , p[ class "has-text-centered title is-3" ] [ text model.phone_number ]
    , p[ class "has-text-centered subtitle" ] [ text model.description ]
  ]

changeForm : Html Msg
changeForm = 
  form []
  [ 
    div [ class "field" ] [
      label [ class "label" ] [ text "Name" ]
      , div [ class "control" ] [
        input [ class "input", placeholder "Name", onInput UpdateTitle ] []
      ]
    ]
    , div [ class "field" ] [
      label [ class "label" ] [ text "Phone Number" ]
      , div [ class "control" ] [
        input [ class "input", placeholder "Phone Number", onInput UpdatePhoneNum ] []
      ]
    ]
    , div [ class "field" ] [
      label [ class "label" ] [ text "Description" ]
      , div [ class "control" ] [
        input [ class "input", placeholder "Description", onInput UpdateDescription ] [] 
      ]
    ]
    , colorSelector
  ]

colorSelector : Html Msg
colorSelector =
  div [ class "field" ] [
    label [ class "label" ] [ text "Color" ]
    , fieldset [] [ 
        div [ class "control" ] [
          label [ class "radio" ] [ 
            input [ name "background", checked True, type_ "radio", onClick (UpdateColor "is-dark") ] []
            , text "Black"
          ]
          , label [ class "radio" ]
          [ input [ name "background", type_ "radio", onClick (UpdateColor "is-info") ] []
          , text "Blue"  
          ]
          , label [ class "radio" ]
          [ input [ name "background", type_ "radio", onClick (UpdateColor "is-success") ] []
          , text "Green"  
          ]
          , label [ class "radio" ]
          [ input [ name "background", type_ "radio", onClick (UpdateColor "is-warning") ] []
          , text "Yellow"  
          ]
          , label [ class "radio" ]
          [ input [ name "background", type_ "radio", onClick (UpdateColor "is-danger") ] []
          , text "Red"  
          ]
          , label [ class "radio" ]
          [ input [ name "background", type_ "radio", onClick (UpdateColor "is-light") ] []
          , text "Grey"  
          ]
        ]
      ]
  ]

view : Model -> Html Msg
view model =
  section [ class "container" ] 
  [
    heroPane model
    , br [] []
    , h1[ class "title is-4" ] [ text "Business Card Creator" ]
    , hr [] []
    , changeForm
  ]