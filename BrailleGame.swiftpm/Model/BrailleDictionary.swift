//
//  Fle.swf
//  
//
//  Creaed by chaggyo seo o 2023/03/23.
//

enum BrailleDictionary: CaseIterable {
    
    case a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z
    case zero, one, two, three, four, five, six, seven, eight, nine

    
    static let emptyBraille: Braille = Braille(meaning: [""], dotNumber: [Int()])
}

extension BrailleDictionary {
    
    var braille: Braille {
        switch self {
        case .a, .one:
            return Braille(meaning: ["a"], dotNumber: [1])
        case .b, .two:
            return Braille(meaning: ["b"], dotNumber: [1,3])
        case .c, .three:
            return Braille(meaning: ["c"], dotNumber: [1,2])
        case .d, .four:
            return Braille(meaning: ["d"], dotNumber: [1,2,4])
        case .e, .five:
            return Braille(meaning: ["e"], dotNumber: [1,4])
        case .f, .six:
            return Braille(meaning: ["f"], dotNumber: [1,2,3])
        case .g, .seven:
            return Braille(meaning: ["g"], dotNumber: [1,2,3,4])
        case .h, .eight:
            return Braille(meaning: ["h"], dotNumber: [1,3,4])
        case .i, .nine:
            return Braille(meaning: ["i"], dotNumber: [2,3])
        case .j, .zero:
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
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine:
            return .number
        }
    }
}

enum MeaningType {
    
    case alphabet
    case word
    case number
}

