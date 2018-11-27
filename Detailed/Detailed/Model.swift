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
        //defining character, character has a rawValue property and
        //the 000 are numbers in the image
        let characterName = "\(character.rawValue)000"
        //if there is no character name just return an UIImage
        return UIImage(named: characterName) ?? UIImage()
        
    }
    
    func cells(for character: Animation) -> [UIImage] {
        // RETURN AN ARRAY OF IMAGES FOR THE GIVEN CHARACTER HERE
        //provide a variable to put images from array into
        var imageArray: [UIImage] = []
        
        //for character at a specific index i want to return all the cellcounts of all the images for that character to animate. if no character exist just return empty
        guard let characterIndex = cellCounts.index(forKey: character) else { return [] }
        
        //allows for the max frams to be whatever the value of cellcounts that character has
        let maxFrameInt = cellCounts.values[characterIndex]
        
        //needs to loop through all the image frames so that the character looks animated
        for i in 1..<maxFrameInt {
            //figuring how the raw value for each character
            let characterName = character.rawValue
            //sets padding
            let paddedInt = i.stringPadded(to: 3)
            //sets image Name
            let imageName = characterName + paddedInt
            //if the UIImage does not have a name then return just a UIImage
            let image = UIImage(named: imageName) ?? UIImage()
            //once the character has been determined, the padding, the name, the images add that character to the array
            imageArray.append(image)
        }
        return imageArray
    }
}
