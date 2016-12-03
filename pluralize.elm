import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

type alias Model =
    { shelves : Int}
model =
    { shelves = 0 }


update action model =
    model


pluralize singular plural quantity =
    if quantity == 1 then
        singular
    else
        plural


main =
  Html.beginnerProgram { model = model, view = view, update = update }


view : Model -> Html
view address model =
    div [ class "content" ]
    [ h1 [] [ text "Pluralizer" ]
    , text (pluralize "shelf" "shelves" model.shelves)
    ]
