//
//  Fle.swf
//  
//
//  Creaed by chaggyo seo o 2023/03/23.
//

enum BrailleDictionary: CaseIterable {
    
    case a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z
    
    
    static let emptyBraille: Braille = Braille(meaning: [""], dotNumber: [Int()])
}

extension BrailleDictionary {
    
    static func alphabetToBraile(_ text: String) -> Braille {
        var braille = BrailleDictionary.allCases.first { word in
            word.braille.meaning.contains(where: { $0 == text })
        }
        return braille!.braille
    }
    
    static func wordtoBrailes(_ texts: String) -> [Braille] {
        
        var answer = [Braille]()
        for text in texts {
            answer.append(BrailleDictionary.alphabetToBraile("\(text)"))
        }
        
        return answer
    }
    
    static func dotsToAlphabet(_ dots: [Dot]) -> String {
        var braille = BrailleDictionary.allCases.first { word in
            word.braille.dots == dots
        }
        if let answer = braille?.braille.meaning.first! {
            return answer
        }
        return ""
    }
    
    var braille: Braille {
        switch self {
        case .a:
            return Braille(meaning: ["a"], dotNumber: [1])
        case .b:
            return Braille(meaning: ["b"], dotNumber: [1,3])
        case .c:
            return Braille(meaning: ["c"], dotNumber: [1,2])
        case .d:
            return Braille(meaning: ["d"], dotNumber: [1,2,4])
        case .e:
            return Braille(meaning: ["e"], dotNumber: [1,4])
        case .f:
            return Braille(meaning: ["f"], dotNumber: [1,2,3])
        case .g:
            return Braille(meaning: ["g"], dotNumber: [1,2,3,4])
        case .h:
            return Braille(meaning: ["h"], dotNumber: [1,3,4])
        case .i:
            return Braille(meaning: ["i"], dotNumber: [2,3])
        case .j:
            return Braille(meaning: ["j"], dotNumber: [2,3,4])
        case .k:
            return Braille(meaning: ["k"], dotNumber: [1,5])
        case .l:
            return Braille(meaning: ["l"], dotNumber: [1,3,5])
        case .m:
            return Braille(meaning: ["m"], dotNumber: [1,2,5])
        case .n:
            return Braille(meaning: ["n"], dotNumber: [1,2,4,5])
        case .o:
            return Braille(meaning: ["o"], dotNumber: [1,4,5])
        case .p:
            return Braille(meaning: ["p"], dotNumber: [1,2,3,5] )
        case .q:
            return Braille(meaning: ["q"], dotNumber: [1,2,3,4,5])
        case .r:
            return Braille(meaning: ["r"], dotNumber: [1,3,4,5])
        case .s:
            return Braille(meaning: ["s"], dotNumber: [2,3,5])
        case .t:
            return Braille(meaning: ["t"], dotNumber: [2,3,4,5])
        case .u:
            return Braille(meaning: ["u"], dotNumber: [1,5,6])
        case .v:
            return Braille(meaning: ["v"], dotNumber: [1,3,5,6])
        case .w:
            return Braille(meaning: ["w"], dotNumber: [2,3,4,6])
        case .x:
            return Braille(meaning: ["x"], dotNumber: [1,2,5,6])
        case .y:
            return Braille(meaning: ["y"], dotNumber: [1,2,4,5,6])
        case .z:
            return Braille(meaning: ["z"], dotNumber: [1,4,5,6])
        }
    }
    
    var meaingType: MeaningType {
        
        switch self {
        case .a,.b,.c,.d,.e,.f,.g,.h,.i,.j,.k,.l,.m,.n,.o,.p,.q,.r,.s,.t,.u,.v,.w,.x,.y,.z:
            return .alphabet
        }
    }
    
    static func isHere(it target: Braille) -> Braille? {
        return BrailleDictionary.allCases.first { $0.braille == target }?.braille
    }
}

enum MeaningType {
    
    case alphabet
    case word
    case number
}

