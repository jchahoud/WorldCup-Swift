println("Hey Swift, é Copa do Mundo!!!!")
    //Variaveis e constantes
    let player:String = "Neymar"
//let player = "Neymar"
var goals = 4
var playerInfo = "Gols do Neymar: " + String(goals)
let moreInfo = "\(player) marcou \(goals) gols !"
// Optionals
var matchWinner: String? = nil
matchWinner = "Brasil"
//let unwrapped = matchWinner!
// Array
var bestPlayers = ["Neymar", "Thiago Silva", "Fred", "Dani Alves"]
bestPlayers += "Fernandinho" //append
bestPlayers[1..3]
let removedPlayer = bestPlayers.removeAtIndex(0)
var goodArgentinianPlayers = String[]()
// Dictionary
var titles = [
    "2002": "Brasil",
    "2006": "Italia",
    "2010": "Espanha"
]
titles["2014"] = "Brasil"
var argentinaTitles = Dictionary<String, String>()
//Loopings
for (key, value) in titles {
    println("\(key): \(value)")
}
for _ in 1...3 {
    // Do something three times.
}
// Switch
let stadium = "Minerao"
switch stadium {
case "Beira-Rio":
let comment = "Leve um casaco!"
case "Fonte Nova", "Arena das Dunas":
let comment = "Bora curtir o Nordeste"
case let x where x.hasSuffix("ao"):
    let comment = "Minerao, Castelao ou Itaquerao!"
default:
    let comment = ("outro estadio")
}
// Functions
func nextMatch(team: String, day: String) -> String {
    return "Brasil x \(team) eh \(day)."
}
let x = nextMatch ("Chile", "Sabado")
// Closures
let points = { (wins:Int) in println("Pontos: \(wins*3)") }

    //classes
    class Match {
        var homeTeam:String
        var awayTeam:String
        init(hTeam:String, aTeam:String){
            self.homeTeam = hTeam
            self.awayTeam = aTeam
        }
        func start() {
            //…
        }
    }
    
    class BrasileiraoMatch: Match {
        //…
    }
    
var match = Match(hTeam: "Brasil", aTeam:"Chile")

    // Generics
    func swapTwoValues<T>(inout a: T, inout b: T) {
        let temporaryA = a
        a = b
        b = temporaryA
    }

//swapTwoValues(in, 2)
    
    //extensions
    extension Array {
        func first () -> Any? {
            return self[0]
        }
}

let a = bestPlayers.first()

