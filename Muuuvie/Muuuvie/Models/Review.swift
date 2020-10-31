//
//  Review.swift
//  Muuuvie
//
//  Created by Lucas Eduardo Backes on 31/10/20.
//

import Foundation

struct Review: Decodable {
    let author: String
    let review: String
    
    func getAvatar() -> String {
        let randomNumber: Int = Int.random(in: 1...100)
        
        return "https://avatars.dicebear.com/api/human/\(randomNumber).svg"
    }
    
    static var mocked: Review {
        Review(author: "Sarah Green", review: "The French Revolution constituted for the conscience of the dominant aristocratic class a fall from innocence, and upturning of the natural chain of events that resounded all over Europe The French Revolution constituted for the conscience of the dominant aristocratic class a fall from innocence, and upturning of the natural chain of events that resounded all over Europe")
    }
}

//"id": "57a814dc9251415cfb00309a",
//"author": "Frank Ochieng",
//"content": "Summertime 2016 has not been very kind to DC Comics-based personalities looking to shine consistently like their big screen Marvel Comics counterparts. Following the super-sized dud that was _Batman v. Superman: Dawn of Justice_ released a few months ago must really put some major pressure on Warner Bros. to gamble on ensuring that the presence of **Suicide Squad** does not meet the same kind of indifferent reception. Well, it turns out that although the anticipation was high for writer-director David Ayer's supervillain saga involving high-powered imprisoned rogues recruited as U.S. governmental operatives out to stop other skillful baddies (as it was for Zack Ryder's aforementioned \"Dawn of Justice\") the concoction of **Suicide Squad** feels like a colorful mishmash of collective misfits laboriously taking up space in a disjointed eye candy-coated spectacle that never manages to match its intended sizzle.",
//"url": "https://www.themoviedb.org/review/57a814dc9251415cfb00309a"
