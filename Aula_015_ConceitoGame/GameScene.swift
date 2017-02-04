import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    //MARK: Propriedades
    var backG1 = SKSpriteNode()
    var backG2 = SKSpriteNode()
    var player = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        
        backG1 = self.childNode(withName: "espaco") as! SKSpriteNode
        backG2 = self.childNode(withName: "espaco2") as! SKSpriteNode
        player = self.childNode(withName: "player") as! SKSpriteNode
    

    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for toque in touches{
            let local = toque.location(in: self)
            if player.contains(local) {
                player.position.y = local.y
                player.position.x = local.x
            }
        }

    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {

    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {

    }
    
    
    override func update(_ currentTime: TimeInterval) {
        let velocidade : CGFloat = 7.5
        backG1.position = CGPoint(x: backG1.position.x - velocidade, y: backG1.position.y)
        backG2.position = CGPoint(x: backG2.position.x - velocidade, y: backG2.position.y)
        
        if backG1.position.x < -backG1.size.width{
            backG1.position = CGPoint(x: backG2.position.x + backG2.size.width, y: backG1.position.y)
        }
        
        if backG2.position.x < -backG2.size.width{
            backG2.position = CGPoint(x: backG1.position.x + backG1.size.width, y: backG2.position.y)
        }
    }
}
