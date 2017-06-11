module Todo exposing (..)

import Html exposing (Html, h1, text, div, form, input, ul, li, button)
import Html.Attributes exposing (value, class, type_, placeholder)
import Html.Events exposing (onClick, onInput)


type Msg
    = Save
    | InputTodo String


type alias Todo =
    { id : Int
    , text : String
    , completed : Bool
    }


type alias Model =
    { todos : List Todo
    , newTodo : String
    }



-- MODEL


initialModel : Model
initialModel =
    { todos =
        [ { id = 1, text = "Mandi", completed = False }
        , { id = 2, text = "Makan", completed = False }
        , { id = 3, text = "Coding", completed = True }
        ]
    , newTodo = ""
    }



-- UPDATE


update : Msg -> Model -> Model
update msg model =
    case msg of
        InputTodo newTodo ->
            { model | newTodo = newTodo }

        Save ->
            { model
                | todos = Todo 3 model.newTodo False :: model.todos
                , newTodo = ""
            }



-- VIEW


view : Model -> Html Msg
view model =
    div [ class "container" ]
        [ h1 [] [ text "Elm Todo" ]
        , viewForm model
        , viewTodos model
        ]


viewForm : Model -> Html Msg
viewForm model =
    div []
        [ input
            [ type_ "text"
            , placeholder "What you want to do?"
            , onInput InputTodo
            , value model.newTodo
            ]
            []
        , button [ onClick Save ] [ text "Do!" ]
        ]


viewTodos : Model -> Html Msg
viewTodos model =
    ul []
        (List.map (\todo -> viewTodo todo) model.todos)


viewTodo : Todo -> Html Msg
viewTodo todo =
    li [] [ text todo.text ]


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = initialModel
        , view = view
        , update = update
        }
