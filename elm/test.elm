import Html exposing (Html, Attribute, text, div, input, button)
import Html.App exposing (beginnerProgram)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)
import String


main =
  beginnerProgram { model = model, view = view, update = update }

-- MODEL

type alias Model =
  { content : String
  }

model : Model
model =
  { content = "" }

-- UPDATE

type Msg
  = Change String

update : Msg -> Model -> Model
update msg model =
  case msg of
    Change newContent ->
      { model | content = newContent }

-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ input [ placeholder "Text to reverse", onInput Change, myStyle ] []
    , div [myStyle] [ text (String.reverse model.content) ]
    ]

myStyle =
  style
    [ ("width", "100%")
    , ("height", "40px")
    , ("padding", "10px 0")
    , ("font-size", "2em")
    , ("text-align", "center")
    ]
