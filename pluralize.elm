import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

pluralize singular plural quantity =
    if quantity == 1 then
        singular
    else
        plural

main =
    div [ class "content" ]
    [ h1 [] [ text "Pluralizer" ]
    , text (pluralize "shelf" "shelves" 5)
    ]
