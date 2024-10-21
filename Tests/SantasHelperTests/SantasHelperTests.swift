import Testing

struct SantasHelperTests {
    
    private let aboutEqual = { abs($0 - $1) < 0.001 }
    
    @Test func testCartesianToPolar() async throws {
        let coordinate = (x: 11.713, y: 5.6405)
        let (actualR, actualPhi) = cartesianToPolar(coordinate)
        #expect(aboutEqual(actualR, 13.0) && aboutEqual(actualPhi, 0.4488) == true)
    }
    
    @Test func testCartesianToPolarQ3() async throws {
        let coordinate = (x: -4.7292, y: -2.4096)
        let (actualR, actualPhi) = cartesianToPolar(coordinate)
        #expect(aboutEqual(actualR, 5.3077) && aboutEqual(actualPhi, -2.6704) == true)
    }
    
    @Test func testCombineRecords() async throws {
        let id = Int.random(in: 0..<1_000_000)
        let toy =
        ["Chemistry set", "Race car", "Box kite", "Building brick set", "Talking doll"]
            .randomElement()!
        let productLead =
        ["Binkles", "Snowii", "Jinkies", "Pippi", "Zippit", "Xandi", "Alf"]
            .randomElement()!
        let children =
        [
            "Inés", "Maxime", "Bandile", "Shaurya", "Екатерина", "Anika", "Yael",
            "Dimitrios", "Евгений", "Iminathi", "Valeria", "Marlon", "Mitsuki",
            "Bjarni", "Venla", "Anton", "Beatriz", "Joo-won", "Zahra", "Liam", "Parker",
        ]
        let numberOfRecipients = Int.random(in: 0..<children.count)
        let recipients = Array(children.shuffled().prefix(numberOfRecipients))
        let actual =
        combineRecords(
            production: (toy: toy, id: id, productLead: productLead),
            gifts: (id, recipients)
        )
        
        #expect(
            (actual.id == id && actual.toy == toy && actual.productLead == productLead
            && actual.recipients == recipients) == true
        )
    }
}
