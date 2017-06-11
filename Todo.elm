module Todo exposing (..)

import Html exposing (Html, h1, text, div, form, input, ul, li, button)
import Html.Attributes exposing (classList, value, class, type_, placeholder, method)
import Html.Events exposing (onSubmit, onClick, onInput)


type Msg
    = Save
    | InputTodo String
    | Done Int


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
        Done id ->
            let
                toggleComplete todo =
                    if todo.id == id then
                        { todo | completed = (not todo.completed) }
                    else
                        todo

                newTodos =
                    List.map toggleComplete model.todos
            in
                { model | todos = newTodos }

        InputTodo newTodo ->
            { model | newTodo = newTodo }

        Save ->
            { model
                | todos = Todo ((List.length model.todos) + 1) model.newTodo False :: model.todos
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
    form [ method "POST", onSubmit Save ]
        [ input
            [ type_ "text"
            , placeholder "What you want to do?"
            , onInput InputTodo
            , value model.newTodo
            ]
            []
        , button [ type_ "submit" ] [ text "Do!" ]
        ]


viewTodos : Model -> Html Msg
viewTodos model =
    ul []
        (List.map (\todo -> viewTodo todo) model.todos)


viewTodo : Todo -> Html Msg
viewTodo todo =
    li
        [ classList [ ( "done", todo.completed ) ]
        , onClick (Done todo.id)
        ]
        [ text todo.text ]


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = initialModel
        , view = view
        , update = update
        }
