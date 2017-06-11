module Todo exposing (..)

import Html exposing (h1, text, div, form, input, ul, li)
import Html.Attributes exposing (class, type_, placeholder)


initialModel =
    { todos =
        [ { id = 1, text = "Mandi", completed = False }
        , { id = 2, text = "Makan", completed = False }
        , { id = 3, text = "Coding", completed = True }
        ]
    }


view model =
    div [ class "container" ]
        [ h1 [] [ text "Elm Todo" ]
        , form []
            [ input [ type_ "text", placeholder "What you want to do?" ] []
            , input [ type_ "submit" ] [ text "Do!" ]
            ]
        , ul []
            (List.map (\todo -> viewTodo todo) model.todos)
        ]


viewTodo todo =
    li [] [ text todo.text ]


main =
    view initialModel
