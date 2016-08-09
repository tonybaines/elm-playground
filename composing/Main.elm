module Main exposing (..)

import Html exposing (Html)
import Html.App
import Widget


-- MODEL
type alias AppModel =
    -- Note: Main knows the name but not details of Widget.Model
    { widgetModel : Widget.Model
    }

initialModel : AppModel
initialModel =
    { widgetModel = Widget.initialModel
    }

init : ( AppModel, Cmd Msg )
init =
    ( initialModel, Cmd.none )


-- MESSAGES
-- Note: again, Main knows the name but not details of Widget.Msg
-- just enough info to route messages
type Msg
    = WidgetMsg Widget.Msg


-- VIEW
view : AppModel -> Html Msg
view model =
    Html.div []
        -- Map from Widget.Msg
        -- Html.App.map tags messages comming from the sub view using the WidgetMsg tag
        [ Html.App.map WidgetMsg (Widget.view model.widgetModel)
        ]


-- UPDATE
update : Msg -> AppModel -> ( AppModel, Cmd Msg )
update message model =
    -- Pattern match the message
    case message of
        WidgetMsg subMsg ->
            -- Destructure the result of Widget.update ...
            -- into ( updatedWidgetModel, widgetCmd )
            let
                ( updatedWidgetModel, widgetCmd ) =
                    Widget.update subMsg model.widgetModel
            -- use the values to form the updated Main.model
            in
                ( { model | widgetModel = updatedWidgetModel }, Cmd.map WidgetMsg widgetCmd )


-- SUBSCIPTIONS
subscriptions : AppModel -> Sub Msg
subscriptions model =
    Sub.none


-- APP
main : Program Never
main =
    Html.App.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }