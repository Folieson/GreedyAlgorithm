import UIKit

var statesNeeded:Set<String> = ["mt","wa","or","id","nv","ut","ca","az"]

var stations:Dictionary<String,Set<String>> = Dictionary.init()
stations.updateValue(["id","nv","ut"], forKey: "kone")
stations.updateValue(["wa","id","mt"], forKey: "ktwo")
stations.updateValue(["or","nv","ca"], forKey: "kthree")
stations.updateValue(["nv","ut"], forKey: "kfour")
stations.updateValue(["ca","az"], forKey: "kfive")

var finalStations:Set<String> = Set.init()
while !statesNeeded.isEmpty {
    var bestStation = ""
    var statesCovered:Set<String> = Set.init()
    stations.forEach({ station, statesForStation in
        let covered = statesNeeded.intersection(statesForStation)
        if covered.count > statesCovered.count {
            bestStation = station
            statesCovered = covered
        }
    })
    statesNeeded = statesNeeded.subtracting(statesCovered)
    finalStations.insert(bestStation)
}

print(finalStations)
