//
//  QuestionsViewController.swift
//  Questions
//
//  Created by Howe on 2023/11/11.
//

import UIKit // 引入UIKit框架，用於iOS應用的用戶界面開發

// 定義一個繼承自UIViewController的QuestionsViewController類，用於顯示和管理問題
class QuestionsViewController: UIViewController {
    
    // 以下使用@IBOutlet連接故事板（Storyboard）中的UI元件
    @IBOutlet weak var navigationTitleOutlet: UINavigationItem! // 導航欄標題
    @IBOutlet weak var questionTextLabel: UILabel! // 用於顯示問題文本的標籤
    @IBOutlet var optionsButtonsOutlet: [UIButton]! // 一組選項按鈕
    @IBOutlet weak var answerDescriptionLabel: UILabel! // 用於顯示答案描述的標籤
    @IBOutlet weak var scoreLabel: UILabel! // 用於顯示分數的標籤
    @IBOutlet weak var againButtonOutlet: UIButton! // “再玩一次”按鈕
    
    // 定義用於跟蹤用戶選擇的年級和科目的變數
    var grade: Grade?
    var subject: Subjects?
    
    // 定義並追踪用戶分數，使用property observer更新分數標籤
    var score = 0 {
        didSet {
            scoreLabel.text = "分數：\(score)"
        }
    }
    
    // 定義並追踪獎勵分數，達到一定條件時增加主分數
    var bonusScore: Int = 0 {
        didSet {
            if bonusScore == 4 {
                score += 30
                bonusScore = 0
            }
        }
    }
    
    // 用於標記當前問題是否已被回答
    var isAnswered = false
    
    // 存儲當前問題集合的陣列
    var currentQuestions: [Question] = []
    // 紀錄當前顯示問題的索引
    var currentQuestionIndex = 0
    
    
    // viewDidLoad方法，在視圖控制器的視圖加載完成時調用
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView() // 配置視圖的初始設置
        loadQuestions() // 加載問題
        displayCurrentQuestion() // 顯示當前問題
    }
    
    
    // MARK: - IBAction Section
    
    
    // 處理選項按鈕點擊的動作
    @IBAction func optionButtonTapped(_ sender: UIButton) {
        if isAnswered {
            // 如果當前問題已被回答，點擊按鈕將加載下一個問題
            currentQuestionIndex += 1
            displayCurrentQuestion()
            isAnswered = false
            return
        }
        
        // 獲取選中按鈕的索引
        guard let selectedIndex = optionsButtonsOutlet.firstIndex(of: sender) else { return }
        
        // 獲取當前問題
        let question = currentQuestions[currentQuestionIndex]
        
        // 檢查用戶選擇的答案是否正確，並採取相應行動
        if question.correctAnswer == selectedIndex {
            // 如果答案正確
            bonusScore += 1 // 增加獎勵分數
            score += 10 // 增加主分數
            answerDescriptionLabel.text = question.answerDescription // 顯示答案描述
            
            // 更新UI元件狀態以反映正確答案
            for button in optionsButtonsOutlet {
                button.isEnabled = false
                button.backgroundColor = .systemGray
                button.setTitleColor(.darkGray, for: .normal)
            }
            
            sender.setTitleColor(.black, for: .normal)
            sender.backgroundColor = .systemGreen
            sender.isEnabled = true
            sender.setTitle("答對了！下一題", for: .normal)
            
            // 檢查是否已經是最後一題
            if currentQuestionIndex == 9 {
                sender.setTitle("答對了！題目結束", for: .normal)
                againButtonOutlet.isHidden = false
                for optionButton in optionsButtonsOutlet {
                    optionButton.isEnabled = false
                }
            }
            isAnswered = true
            
        } else {
            // 如果答案錯誤
            bonusScore = 0 // 重置獎勵分數
            answerDescriptionLabel.text = question.answerDescription // 顯示答案描述
            
            // 更新UI元件狀態以反映錯誤答案
            for button in optionsButtonsOutlet {
                button.isEnabled = false
                button.backgroundColor = .systemGray
                button.setTitleColor(.darkGray, for: .normal)
            }
            
            sender.setTitleColor(.black, for: .normal)
            sender.backgroundColor = .systemRed
            sender.isEnabled = true
            sender.setTitle("答錯了！下一題", for: .normal)
            
            // 檢查是否已經是最後一題
            if currentQuestionIndex == 9 {
                sender.setTitle("答錯了！題目結束", for: .normal)
                againButtonOutlet.isHidden = false
                for optionButton in optionsButtonsOutlet {
                    optionButton.isEnabled = false
                }
            }
            isAnswered = true
        }
    }
    
    
    
    // 處理再玩一次按鈕的動作
    @IBAction func newRound(_ sender: UIButton) {
        setUpView() // 重新配置視圖
        loadQuestions() // 重新加載問題
        displayCurrentQuestion() // 顯示新一輪的第一個問題
    }
    
    
    
    // MARK: - function Section
    
    
    // setUpView() 方法用於初始化或重置視圖的狀態
    func setUpView() {
        currentQuestionIndex = 0 // 將當前問題索引重置為0
        score = 0 // 重置分數為0
        bonusScore = 0 // 重置獎勵分數為0
        isAnswered = false // 將是否已回答標記設為false
        
        questionTextLabel.text = "" // 清空問題標籤的文本
        
        // 遍歷所有選項按鈕，將它們的標題清空
        for button in optionsButtonsOutlet {
            button.setTitle("", for: .normal)
        }
        
        answerDescriptionLabel.text = "" // 清空答案描述標籤的文本
        scoreLabel.text = "分數：\(score)" // 更新分數標籤的文本
        againButtonOutlet.isHidden = true // 隱藏“再玩一次”按鈕
    }
    
    
    
    // loadQuestions() 方法用於加載並處理問題數據
    func loadQuestions() {
        let allQuestions = getAllQuestions() // 獲取所有問題
        
        // 使用filter方法篩選出符合當前年級和科目的問題
        currentQuestions = allQuestions.filter { $0.grade == grade && $0.subject == subject }
        
        currentQuestions.shuffle() // 打亂問題順序
        
        // 遍歷打亂後的問題，重新組合選項並確保正確答案索引的準確性
        for (index, question) in currentQuestions.enumerated() {
            var options = question.options
            options.shuffle()
            let newQuestion = Question(
                grade: grade!,
                subject: subject!,
                question: question.question,
                options: options,
                correctAnswer: options.firstIndex(of: question.options[question.correctAnswer])!,
                answerDescription: question.answerDescription
            )
            currentQuestions[index] = newQuestion
        }
    }
    
    
    
    // displayCurrentQuestion() 方法用於在UI上顯示當前問題及其選項
    func displayCurrentQuestion() {
        if currentQuestions.isEmpty { return } // 如果沒有問題，直接返回
        
        if currentQuestionIndex < 10 {
            let question = currentQuestions[currentQuestionIndex] // 獲取當前問題
            
            questionTextLabel.text = question.question // 設置問題標籤的文本
            
            // 設置導航標題為當前科目和問題編號
            navigationTitleOutlet.title = "\(subject!.rawValue)題目 \(currentQuestionIndex + 1) / 10"
            
            answerDescriptionLabel.text = "" // 清空答案描述標籤的文本
            
            // 設置每個選項按鈕的標題
            for (index, optionButton) in optionsButtonsOutlet.enumerated() {
                optionButton.setTitle(question.options[index], for: .normal)
            }
            
            // 重置選項按鈕的狀態
            for button in optionsButtonsOutlet {
                button.isEnabled = true
                button.backgroundColor = .white
                button.setTitleColor(.black, for: .normal)
            }
        } else {
            // 如果已經達到問題數量上限，禁用所有選項按鈕
            for optionButton in optionsButtonsOutlet {
                optionButton.isEnabled = false
            }
        }
    }
    
    
    
}
