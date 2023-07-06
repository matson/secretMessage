/*
 Hello! Thank you for taking the time to complete our
 coding challenge. There are 3 challenges, each on a
 separate page. The clue derived from each page will
 provide instructions for the next challenge.

 We recommend turning "Editor > Show Rendered Markup"
 on for a classier experience.

 When you are done, please rename this playground to
 "first-last Ramp Challenge.playground" and submit it to
 ios-submissions@ramp.com.

 Good Luck!

 - The Ramp Mobile Team

 */

// = = = = = = = = = = = = = = = = = = = = = = = =



import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let prompt = """
/*From the prompt not with the newlines:
 Optional("Great job! Next we\'ve hosted a JSON file at at this url: https://api.jsonbin.io/v3/b/646bed328e4aa6225ea22a79. Your job is to write a script to download the contents of the URL (hint: The X-ACCESS-KEY is $2b$10$Ke1iwieFO7/7qsSKU.GYU.oYXZMW1EeHrwd4xx9ylboJik5mstZk6)
    1). sort the data by each elements \'bar\' key
    2). filter out elements where \'baz\' is not divisible by 3
    3). concatenate each elements \'foo\' value
    Do each of these steps to reveal the instructions for the final part. Remember to show your work!")

 */

//Message: "You need to pass X-Master-Key or X-Access-Key in the header to read a private bin"

"""

// Show your work here! When you are done move on to Challenge 3
class Script {
        
    // MARK: - Welcome
    struct Welcome: Codable {
        let record: Record
        let metadata: Metadata
    }

    // MARK: - Metadata
    struct Metadata: Codable {
        let id: String
        let metadataPrivate: Bool
        let createdAt: String

        enum CodingKeys: String, CodingKey {
            case id
            case metadataPrivate = "private"
            case createdAt
        }
    }

    // MARK: - Record
    struct Record: Codable {
        let data: [Datum]
    }

    // MARK: - Datum
    struct Datum: Codable {
        let foo: String
        let bar, baz: Int
    }
    
    var dataArray: [Datum] = []
    var sortedArray: [Datum] = []
    var filteredArray: [Datum] = []
    var messageArray: [String] = []

    func getMysteryContent(urlString: String, key: String){

        let url = URL(string: urlString)!
        var mutableRequest = NSMutableURLRequest(url: url)
        mutableRequest.setValue(key, forHTTPHeaderField: "X-Access-Key")
        
        let task = URLSession.shared.dataTask(with: mutableRequest as URLRequest, completionHandler: { (data, response, error) in
            
            //check for error
            if let error = error {
              print("Error accessing swapi.co: /(error)")
              return
            }
        
            //http response result
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Error with the response, unexpected status code: \(response)")
                return
            }

            //check the data
            if let safeData = data {
                let decoder = JSONDecoder()
                do {
                    
                    //bytes to string
                    let strings = String(decoding: safeData, as: UTF8.self)
                    //print(strings) -- shows structure
                    let decodedData = try decoder.decode(Welcome.self, from: safeData)
                    self.dataArray = decodedData.record.data
                    
                    //final message
                    let message = self.findMessage()
                    //print(message)
                    

                } catch let error as NSError {
                    print(error)
                }
            }
       PlaygroundPage.current.finishExecution()
       })
        //run the task.
       task.resume()

    }
    
    func findMessage() -> String {
        //sort asc. or desc?
        sortedArray = dataArray.sorted(by: {$0.bar < $1.bar})
        //filter
        filteredArray = sortedArray.filter({ (datum)  -> Bool in
            return datum.baz % 3 == 0
        })
        //concatenate
        messageArray = filteredArray.map({ (datum) -> String in
            return datum.foo
        })
        var newString = messageArray.joined(separator:" ")
        return newString
    }

}

let url = "https://api.jsonbin.io/v3/b/646bed328e4aa6225ea22a79"
let xKey = "$2b$10$Ke1iwieFO7/7qsSKU.GYU.oYXZMW1EeHrwd4xx9ylboJik5mstZk6"
let script = Script()
script.getMysteryContent(urlString: url, key: xKey)

/*
 N i c e   W o r k !   F o r   t h e   f i n a l   c h a l l e n g e ,   u p d a t e   C o n t e n t V i e w . b o d y   t o   d i s p l a y   a   s m i l e y   f a c e   u s i n g   o n l y   n a t i v e   S w i f t U I   v i e w s   ( n o   S f   S y m b o l s   o r   e m o j i s ) .   B e   c r e a t i v e   a n d   h a v e   f u n !   D o n ' t   f o r g e t   t o   s u b m i t   a   s c r e e n s h o t   o f   y o u r   v i e w   w i t h   t h e   c o m p l e t e d   p l a y g r o u n d .
 */


//: [Challenge 3](@next)
