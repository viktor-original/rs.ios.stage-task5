import UIKit

class MessageDecryptor: NSObject {
    class EncryptedCell {
        
        var count = ""
        var msg = ""
        
        func decryptMsg() -> String {
            
            if msg == "" {
                return ""
            }
            
            let counter = Int(count) ?? 1
            if counter <= 0 {
                return ""
            }
            
            return String.init(repeating: msg, count: counter)
        }
        
        
    }
    
    func decryptMessage(_ message: String) -> String {
        
        var encryptedCellsStack:[EncryptedCell] = [.init()]
        var encryptedCell = encryptedCellsStack.first!
        let currentCell = encryptedCell
        
        for char in message {
            
            if char.isNumber {
                currentCell.count.append(char)
            
            } else if char == "[" {
                encryptedCellsStack.append(.init())
                encryptedCell = encryptedCellsStack.last!
                encryptedCell.count = currentCell.count
                currentCell.count = ""
                
            } else if char == "]" {
                let decryptedMessage = encryptedCell.decryptMsg()
                encryptedCellsStack.removeLast()
                
                if encryptedCellsStack.isEmpty {
                    return ""
                }
                
                encryptedCell = encryptedCellsStack.last!
                encryptedCell.msg.append(decryptedMessage)
                
            } else {
                encryptedCell.msg.append(char)
            }
        }
        return encryptedCell.decryptMsg()
    }
}
