module App exposing (..)

import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)
import Html.App

-- MODEL
type alias Model =
    Bool

-- initial input for the program
-- parameters as expected by Html.App
init : (Model, Cmd Msg)
init =
    (False, Cmd.none)


-- MESSAGES
-- Events that the app responds to
type Msg
    = Expand
    | Collapse

-- VIEW
-- render HTML from the model
view : Model -> Html Msg
view model =
    if model then
        div[]
        [ button [ onClick Collapse] [text "Collapse"]
        , text "Widget"
        ]
    else
        div []
        [button [onClick Expand] [text "Expand"]]


-- UPDATE
-- given an event, transform the model to the new state + the command(s) to perform
update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        Expand ->
            (True, Cmd.none)
        Collapse ->
            (False, Cmd.none)


-- SUBSCRIPTIONS
-- can subscribe to mouse, keyboard, location, ... events
subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


--MAIN
--@startuml
--App -> view: Render view
--App <- view: Trigger message e.g. Expand
--App -> update: Send message with the current state
--App <-- update: Return updated state and command
--App -> view: Render view
--@enduml

main : Program Never
main =
    Html.App.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }