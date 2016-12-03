-- MODEL

type alias Model =
    { topic : String
    , gifUrl : String
    }

init : (Model, Cmd Msg)
init =
    (Model "cats" "waiting.gif", Cmd.none)


-- UPDATE

type Msg
    = MorePlease
    | NewGif (Result, Http.Error String)

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        MorePlease ->
            (model, getRandomGif model.topic)

        NewGif (Ok, newUrl) ->
            ( { model | gifUrl = newUrl }, Cmd.none)

        NewGif (Err _) ->
            (model, Cmd.none)


-- VIEW

view : Model -> Html Msg
view model =
    div []
        [ h2 [] [text model.topic]
        , img [src model.gifUrl] []
        , button [ onClick MorePlease ] [ text "More Please!" ]
        ]
