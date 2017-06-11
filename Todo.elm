module Todo exposing (..)

import Html exposing (h1, text, div, form, input, ul, li)
import Html.Attributes exposing (class, type_, placeholder)


view =
    div [ class "container" ]
        [ h1 [] [ text "Elm Todo" ]
        , form []
            [ input [ type_ "text", placeholder "What you want to do?" ] []
            , input [ type_ "submit" ] [ text "Do!" ]
            ]
        , ul []
            [ li [] [ text "todo" ]
            , li [] [ text "todo" ]
            , li [] [ text "todo" ]
            ]
        ]


main =
    view
