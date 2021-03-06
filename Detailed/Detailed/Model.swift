import UIKit

extension Int {
    fileprivate func stringPadded(to count: Int) -> String {
        var string = String(self)
        while string.count < count { string = "0" + string }
        return string
    }
}

class Model {
    static let shared = Model()
    private init() {}
    
    enum Animation: String, CaseIterable {
        case bureaucrat = "Talking Bureaucrat"
        case frog = "Talking Frog"
        case ranger = "Talking Ranger"
        case vendor = "Talking Vendor"
        case bot = "Talking Woodbot"
    }
    
    private let cellCounts = [Animation.bureaucrat: 26, .frog: 62, .ranger: 86, .vendor: 36, .bot: 69]
    
    var characters: [Animation] {
        return Animation.allCases
    }
    
    func image(for character: Animation) -> UIImage {
        // RETURN THE 000 IMAGE FOR THE GIVEN CHARACTER HERE
        
        //The name of each animation cell is the animation case (like frog)'s rawValue property followed by a three digit number, starting with 000
        //bureaucrat 0-25, frog 0-61 ranger 0-85, vendor 0-35, bot 0-68
        let characterName: String = "\(character.rawValue)000"
        return UIImage(named: characterName) ?? UIImage()

    }
    
    func cells(for character: Animation) -> [UIImage] {
        // RETURN AN ARRAY OF IMAGES FOR THE GIVEN CHARACTER HER
        var imageArray: [UIImage] = []
        
        guard let charIndex = cellCounts.index(forKey: character) else { return [] }
        let maxFrameInt = cellCounts.values[charIndex]
        
        for i in 1..<maxFrameInt {
            let charName = character.rawValue
            let paddedInt = i.stringPadded(to: 3)
            let imageName = charName + paddedInt
            let image = UIImage(named: imageName) ?? UIImage()
            imageArray.append(image)
        }
        
        return imageArray
    }
}
