import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

type alias Model =
    { shelves : Int}
model =
    { shelves = 0 }


type Msg =
    Inc
    | Dec

update : Msg -> Model -> Model
update msg model =
    case msg of
        Inc ->
            { model | shelves = model.shelves + 1 }

        Dec ->
            { model | shelves = model.shelves - 1 }


pluralize singular plural quantity =
    if quantity == 1 then
        singular
    else
        plural


main =
  Html.beginnerProgram { model = model, view = view, update = update }


view : Model -> Html Msg
view model =
    div [ class "content" ]
    [ h1 [] [ text "Pluralizer" ]
    , text (pluralize "shelf" "shelves" model.shelves)
    , text (" " ++ toString model.shelves)
    , div [] [
                button [ onClick Inc ] [ text "more shelves" ]
                , button [ onClick Dec ] [ text "less shelves" ]
            ]
    ]
