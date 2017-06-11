module Todo exposing (..)

import Html exposing (Html, h1, text, div, form, input, ul, li)
import Html.Attributes exposing (class, type_, placeholder)


type alias Todo =
    { id : Int
    , text : String
    , completed : Bool
    }


type alias Model =
    { todos : List Todo
    }


initialModel : Model
initialModel =
    { todos =
        [ { id = 1, text = "Mandi", completed = False }
        , { id = 2, text = "Makan", completed = False }
        , { id = 3, text = "Coding", completed = True }
        ]
    }


view : Model -> Html msg
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


viewTodo : Todo -> Html msg
viewTodo todo =
    li [] [ text todo.text ]


main : Html msg
main =
    view initialModel
