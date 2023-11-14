//
//  QuestionsModel.swift
//  Questions
//
//  Created by Howe on 2023/11/11.
//

import Foundation


struct Question {
    let grade : Grade
    let subject : Subjects
    let question : String
    let options : [String]
    let correctAnswer : Int
    let answerDescription : String
}



enum Grade : String {
    case one = "國小一年級"
    case two = "國小二年級"
    case three = "國小三年級"
    case four = "國小四年級"
    case five = "國小五年級"
    case six = "國小六年級"
}



enum Subjects : String {
    case Mandarin = "國語"
    case English = "英語"
    case Mathematics = "數學"
    case Science = "自然科學"
    case SocialStudies = "社會"
    case ArtsAndHumanities = "藝術與人文"
}




func getAllQuestion2(grade:Grade, subject:Subjects) -> [Question] {
    
    let questions = [ Question(
        grade: .three,
        subject: .Mandarin,
        question: "小船上要「ㄗㄞˋ」什麼呢？\n\n「  」 中的國字是哪一個？",
        options: ["戴", "在", "載", "再"],
        correctAnswer: 2,
        answerDescription: "答案\n\n小船上要 「載」 什麼呢？"
    ), ]
    
    let exportQuestions = questions.filter { Question in
        Question.grade == grade && Question.subject == subject
    }
    
    return exportQuestions
}





func getAllQuestions() -> [Question] {
    return [
        Question(
            grade: .three,
            subject: .Mandarin,
            question: "小船上要「ㄗㄞˋ」什麼呢？\n\n「  」 中的國字是哪一個？",
            options: ["戴", "在", "載", "再"],
            correctAnswer: 2,
            answerDescription: "答案\n\n小船上要 「載」 什麼呢？"
        ),
        Question(
            grade: .three,
            subject: .Mandarin,
            question: "下列哪一個國字不是 「心部」 ？",
            options: ["恭", "忌", "情", "晴"],
            correctAnswer: 3,
            answerDescription: "答案\n\n「晴」 不是心部"
        ),
        Question(
            grade: .three,
            subject: .Mandarin,
            question: "下列 [  ] 中的國字，\n\n哪一組的部首不同？",
            options: ["[情]緒  /  憂[愁]", "口[訣]  /  禮[讓]", "貌[似]  /  [以]前", "[載]貨  /  [我]們"],
            correctAnswer: 3,
            answerDescription: "答案\n\n「載」 為車部\n「我」 為戈部"
        ),
        Question(
            grade: .three,
            subject: .Mandarin,
            question: "下列國字的部首說明，何者錯誤？",
            options: ["舟：舟部", "忌：己部", "嘆：口部", "字：子部"],
            correctAnswer: 1,
            answerDescription: "答案\n\n忌：心部"
        ),
        Question(
            grade: .three,
            subject: .Mandarin,
            question: "下列哪一個國字的總筆畫數最少",
            options: ["愁", "練", "習", "嘆"],
            correctAnswer: 2,
            answerDescription: "答案\n\n習：11畫"
        ),
        Question(
            grade: .three,
            subject: .Mandarin,
            question: "利用文字加減，\n「房－方＋女」可以變成什麼國字？",
            options: ["妨", "所", "妒", "妍"],
            correctAnswer: 2,
            answerDescription: "答案\n\n妒"
        ),
        Question(
            grade: .three,
            subject: .Mandarin,
            question: "細雨麗在湖面上，\n上頭還有一葉小州搖盪著。\n\n句子中有幾個錯別字？",
            options: ["一個", "兩個", "三個", "四個"],
            correctAnswer: 1,
            answerDescription: "答案\n\n灑 和 舟"
        ),
        Question(
            grade: .three,
            subject: .Mandarin,
            question: "下列哪個國字，不能當作計算「船」或「舟」的單位？",
            options: ["條", "葉", "艘", "把"],
            correctAnswer: 3,
            answerDescription: "答案\n\n把"
        ),
        Question(
            grade: .three,
            subject: .Mandarin,
            question: "「口訣」是什麼意思",
            options: ["容易背誦上口的語句", "談話時所用的語言", "說話的態度及方式", "言語上的爭執或衝突"],
            correctAnswer: 0,
            answerDescription: "答案\n\n容易背誦上口的語句"
        ),
        Question(
            grade: .three,
            subject: .Mandarin,
            question: "下列哪一個詞語的用字完全正確？",
            options: ["洋洋儷儷", "滿戴而歸", "木已成舟", "漢為觀止"],
            correctAnswer: 2,
            answerDescription: "答案\n\n木已成舟"
        ),
        Question(
            grade: .three,
            subject: .Mandarin,
            question: "好像快下雨了，\n你 □ □ 先拿把傘再出門吧！\n\n空格中應填入什麼詞語？",
            options: ["也是", "還是", "就是", "總是"],
            correctAnswer: 1,
            answerDescription: "答案\n\n好像快下雨了，你 還是 先拿把傘再出門吧！"
        ),
        Question(
            grade: .three,
            subject: .Mandarin,
            question: "石字出頭靠 □ 行，甲字出頭要 □ 請。\n\n空格中應填入什麼國字？",
            options: ["友 / 田", "左 / 甲", "有 / 曰", "右 / 申"],
            correctAnswer: 3,
            answerDescription: "答案\n\n右 / 申"
        ),
        Question(
            grade: .three,
            subject: .Mandarin,
            question: "下列哪一句使用 [疑問] 的語氣提出問題？",
            options: ["同學們都到了嗎？", "同學們都到了啊！", "同學們都到了。", "同學們都還沒到。"],
            correctAnswer: 0,
            answerDescription: "答案\n\n同學們都到了嗎？"
        ),
        Question(
            grade: .three,
            subject: .Mandarin,
            question: "下列哪一句使用「平直」的語氣陳述事情？",
            options: ["今天的午餐有濃湯嗎？", "今天的午餐希望有濃湯啊！", "今天的午餐有濃湯。", "今天的午餐有濃湯啊！"],
            correctAnswer: 2,
            answerDescription: "答案\n\n今天的午餐有濃湯。"
        ),
        Question(
            grade: .three,
            subject: .Mandarin,
            question: "疑問句的結尾要使用哪個標點符號？",
            options: ["，", "。", "！", "？"],
            correctAnswer: 3,
            answerDescription: "答案\n\n問號 ？"
        ),
        Question(
            grade: .three,
            subject: .Mandarin,
            question: "工字出頭買 □ 地，\n天字出頭農 □ 愁。\n\n空格中應填入什麼國字？",
            options: ["玉 / 大", "土 / 夫", "干 / 犬", "王 / 太"],
            correctAnswer: 1,
            answerDescription: "答案\n\n土 / 夫"
        ),
        Question(
            grade: .three,
            subject: .Mandarin,
            question: "[小船輕輕走] 和下列哪一個短語的組成方式相同？",
            options: ["魚兒慢慢游", "爺爺教寫字", "美麗新世界", "讓我載著你"],
            correctAnswer: 0,
            answerDescription: "答案\n\n魚兒慢慢游"
        ),
        Question(
            grade: .three,
            subject: .Mandarin,
            question: "下列注音何者錯誤？",
            options: ["[窗] 戶 ㄘㄨㄤ", "[專] 心 ㄓㄨㄢ", "雨 [傘] ㄙㄢˇ", "[語] 言 ㄩˇ"],
            correctAnswer: 0,
            answerDescription: "答案\n\n[窗] 戶 ㄘㄨㄤ 是錯的，應該是 ㄔㄨㄤ"
        ),
        Question(
            grade: .three,
            subject: .Mandarin,
            question: "下列 [  ] 中的國字，哪一組意思是相同的？",
            options: ["姓[名] ／ [名]人", "[歪]斜 ／ [歪]頭", "[專]心 ／ [專]長", "回[答] ／ 報[答]"],
            correctAnswer: 1,
            answerDescription: "答案\n\n[歪]斜 ／ [歪]頭"
        ),
        Question(
            grade: .three,
            subject: .Mandarin,
            question: "奶奶沒有戴眼鏡出門，\n她說看東西就像 □ □ □ □。\n\n空格中應填入什麼詞語？",
            options: ["霧裡看花", "走馬看花", "百花齊放", "頭昏眼花"],
            correctAnswer: 0,
            answerDescription: "答案\n\n霧裡看花"
        ),
        Question(
            grade: .three,
            subject: .Mandarin,
            question: "下列注音何者錯誤？",
            options: ["海「岸」：ㄢˋ", "「迷」路：ㄇ一ˊ", "飛「機」：ㄐ一ˇ", "商「店」：ㄉ一ㄢˋ"],
            correctAnswer: 2,
            answerDescription: "答案\n\n飛「機」：ㄐ一ˇ 應該唸作 ㄐㄧ"
        ),

        Question(
            grade: .three,
            subject: .Mandarin,
            question: "下列哪一組字的部首不同？",
            options: ["迷／料", "扶／撞", "繞／練", "由／留"],
            correctAnswer: 0,
            answerDescription: "答案\n\n迷 辵部\n料 斗部"
        ),

        Question(
            grade: .three,
            subject: .Mandarin,
            question: "利用文字加減，「歡－欠＋見」可以變成什麼國字？",
            options: ["罐", "觀", "灌", "鸛"],
            correctAnswer: 1,
            answerDescription: "答案\n\n觀"
        ),

        Question(
            grade: .three,
            subject: .Mandarin,
            question: "擁有羅盤的農 □ 竟然迷 □ 方向。\n\n空格中應填入什麼國字？",
            options: ["失／夫", "失／失", "夫／夫", "夫／失"],
            correctAnswer: 3,
            answerDescription: "答案\n\n夫／失"
        ),

        Question(
            grade: .three,
            subject: .Mandarin,
            question: "田字出頭 □ 他去，\n曝字少日 □ 雨來。\n\n空格中應填入什麼國字？",
            options: ["申／嚗", "干／爆", "由／暴", "甲／瀑"],
            correctAnswer: 2,
            answerDescription: "答案\n\n由／暴"
        ),
        Question(
            grade: .three,
            subject: .Mandarin,
            question: "這 [家] 店的招牌很特別。\n句中的 [家] 字可以替換成什麼國字？",
            options: ["隻", "間", "天", "朵"],
            correctAnswer: 1,
            answerDescription: "答案\n\n間"
        ),

        Question(
            grade: .three,
            subject: .Mandarin,
            question: "大伯賣的牛肉麵總是有滿滿的肉塊，所以生意非常好。\n可以用下列哪一個詞語形容這家店？",
            options: ["歪打正著", "手忙腳亂", "用料實在", "難以消化"],
            correctAnswer: 2,
            answerDescription: "答案\n\n用料實在"
        ),

        Question(
            grade: .three,
            subject: .Mandarin,
            question: "他把澆口令說得又急又快，令人入謎。\n句子中有幾個錯別字？",
            options: ["一個", "兩個", "三個", "四個"],
            correctAnswer: 1,
            answerDescription: "答案\n\n繞、迷"
        ),

        Question(
            grade: .three,
            subject: .Mandarin,
            question: "我們準備 □ 學材 □ 做實驗。\n空格中應分別填入哪兩個字？",
            options: ["科／科", "料／料", "科／料", "料／科"],
            correctAnswer: 2,
            answerDescription: "答案\n\n科／料"
        ),

        Question(
            grade: .three,
            subject: .Mandarin,
            question: "他發燒了，要 □ □ 送醫院治療。\n空格中應填入什麼詞語？",
            options: ["趕工", "趕緊", "緊張", "緊密"],
            correctAnswer: 1,
            answerDescription: "答案\n\n趕緊"
        ),

        
    ]
}
