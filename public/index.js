function main() {
  const numPlayers = 4;

  var dom = {};
  dom.playerTable = document.getElementById("player-table");
  dom.playerRows = new Array(numPlayers);
  dom.playerCards = new Array(numPlayers);

  for (var playerIdx=0; playerIdx < numPlayers; playerIdx++) {
    dom.playerCards[playerIdx] = new Array(4);
    dom.playerRows[playerIdx] = document.createElement("tr");

    var row = dom.playerRows[playerIdx];
    dom.playerTable.appendChild(row);

    for (var cardIdx=0; cardIdx < 4; cardIdx++) {
      var card = document.createElement("td");
      dom.playerCards[playerIdx][cardIdx] = card;
      row.appendChild(card);

      card.classList.add("card");
      card.innerText = "1";
    }
  }
}

document.addEventListener("DOMContentLoaded", function(event) {
  console.log("DOM fully loaded and parsed");
  main();
});

