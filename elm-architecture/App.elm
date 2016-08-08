module App exposing (..)

import Html exposing (Html, div, text)
import Html.App

-- MODEL
type alias Model =
    String

-- initial input for the program
-- parameters as expected by Html.App
init : (Model, Cmd Msg)
init =
    ("Hello", Cmd.none)


-- MESSAGES
-- Events that the app responds to
type Msg
    = NoOp

-- VIEW
-- render HTML from the model
view : Model -> Html Msg
view model =
    div[]
        [ text model ]


-- UPDATE
-- given an event, transform the model to the new state + the command(s) to perform
update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        NoOp ->
            (model, Cmd.none)


-- SUBSCRIPTIONS
-- can subscribe to mouse, keyboard, location, ... events
subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


--MAIN
main : Program Never
main =
    Html.App.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }