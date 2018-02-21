import Html exposing (..)
import Html.Attributes exposing (placeholder, class, id)
import Html.Events exposing (onInput)

main : Program Never Model Msg
main = Html.beginnerProgram { model = model, view = view, update = update }

-- Model
type alias Model = { title : String, phone_number: String, description : String }
model : Model
model = { title = "Derp Derpington", phone_number = "(555) 555-5555", description = "Attorney at Law." }

-- Update
type Msg = UpdateTitle String 
  | UpdateDescription String
  | UpdatePhoneNum String
update : Msg -> Model -> Model
update msg model =
  case msg of
    UpdateTitle title ->
      { model | title = title }
    UpdateDescription description ->
      { model | description = description }
    UpdatePhoneNum number ->
      { model | phone_number = number }

-- View
view : Model -> Html Msg
view model =
  section [] 
  [
    div [ id "title", class "hero is-centered is-dark is-bold" ]
    [
      h1[ class "has-text-centered title is-1" ] [ text model.title ]
      , p[ class "has-text-centered title is-3" ] [ text model.phone_number ]
      , p[ class "has-text-centered subtitle" ] [ text model.description ]
    ]
    , hr [] []
    , h1[ class "title is-4" ] [ text "Business Card Creator:" ]
    , form []
    [ 
      input [ class "input", placeholder "Name", onInput UpdateTitle ] []
      , input [ class "input", placeholder "Phone Number", onInput UpdatePhoneNum ] []
      , input [ class "input", placeholder "Description", onInput UpdateDescription ] [] 
    ]
  ]