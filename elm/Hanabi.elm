import Html exposing (..)
import Html.Attributes as Attr

main = beginnerProgram
  { model  = newGame
  , update = updateGame
  , view   = viewGame
  }

type alias GameState =
  { numPlayers: Int
  , players: List Player -- it is the first player's turn, the list rotates
  }

type alias Player =
  { hand: List Card
  }

type Input = Play Int | Discard Int | Hint String

type Color = Blue | Green | Red | White | Yellow
colors = [ Blue, Green, Red, White, Yellow ]

colorString : Color -> String
colorString color = case color of
  Blue   -> "blue"
  Green  -> "green"
  Red    -> "red"
  White  -> "white"
  Yellow -> "yellow"

type Rank = One | Two | Three | Four | Five
ranks = [ One, Two, Three, Four, Five ]

rankString : Rank -> String
rankString rank = case rank of
  One   -> "1"
  Two   -> "2"
  Three -> "3"
  Four  -> "4"
  Five  -> "5"

type alias Card =
  { color: Color
  , rank: Rank
  }

newGame : GameState
newGame =
  { numPlayers = 4
  , players = [ { hand = fakeHand1 }
              , { hand = fakeHand2 }
              , { hand = fakeHand3 }
              , { hand = fakeHand4 }
              ]
  }

fakeHand1 = [ { color = Red,    rank = Two }
            , { color = Green,  rank = Two }
            , { color = Blue,   rank = Two }
            , { color = Yellow, rank = Two }
            ]

fakeHand2 = [ { color = White, rank = One }
            , { color = White, rank = Two }
            , { color = White, rank = Three }
            , { color = White, rank = Four }
            ]

fakeHand3 = [ { color = Blue, rank = Two }
            , { color = White, rank = Three }
            , { color = Green, rank = Five }
            , { color = Green, rank = Five }
            ]

fakeHand4 = [ { color = Yellow, rank = Two }
            , { color = White, rank = One }
            , { color = Yellow, rank = Four }
            , { color = White, rank = Three }
            ]

viewGame : GameState -> Html Input
viewGame game = viewPlayers game.players

viewPlayers : List Player -> Html Input
viewPlayers players = table [] (List.map viewPlayer players)

viewPlayer : Player -> Html Input
viewPlayer player = tr [] (List.map viewCard player.hand)

viewCard : Card -> Html Input
viewCard card =
  td [ styleCard card ] [ text (rankString card.rank)]

styleCard : Card -> Attribute Input
styleCard card =
  Attr.style [ ("backgroundColor", colorString card.color)
             , ("border",          "solid 2px")
             , ("width",           "50px")
             , ("height",          "40px")
             , ("padding",         "20px")
             , ("text-align",      "center")
             ]

updateGame : Input -> GameState -> GameState
updateGame msg state = state
