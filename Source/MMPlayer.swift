//
//  Player.swift
//  MetalMindKit
//
//  Created by Victor Vasilica on 4/30/15.
//  Copyright (c) 2015 simple. All rights reserved.
//

import Foundation
import SpriteKit


// MARK: -

/**
    Responsible for player actions, animations and positioning in the `MMArena`.
*/
public class MMPlayer {
    
    // MARK: - variables
    public var textures = [MMMovementDirection: [SKTexture]]()
    public weak var parentScene: SKScene?
    public var playerNode = SKSpriteNode()
    
    /** 
        Initialize `MMPlayer` with the parent scene
    
        :param: parentScene Player parent scene
    */
    public init(parentScene: SKScene) {
        self.parentScene = parentScene
    }
    
    /** 
        Move sprite node in the desiered position using the proper animation
    
        :param: direction In what direction to shift the sprite node
        :param: distance  How far away from the current position
        :param: duration  How fast to complete the animation
    
    */
    public func move(direction: MMMovementDirection, distance: CGFloat, duration: NSTimeInterval) {
        
        switch direction {
        case .Right:
            playerNode.texture = textures[.Right]?.first
            
            if let actionTextures = textures[.Right] {
                let walkAction = SKAction.animateWithTextures(actionTextures, timePerFrame: 1.0/Double(actionTextures.count))
                
                let moveRightAction = SKAction.moveBy(CGVector(dx: 0.0, dy: distance), duration: duration)
                
                let group = SKAction.group([walkAction, moveRightAction])
                
                playerNode.runAction(group, completion: nil)
            }

        default:
            println("nothing to do here")
            
        }
    }
    
    /**
        Move sprite node on the Y coordinate. Automatically detects time, distance, animation
        
        :param: Ycoordinate Where to position the sprite node on the Y axis
    
    */
    public func moveToY(Ycoordinate: CGFloat) {
     // move
    }
}


// player = MetalMindPlayer()
// player.movementTextures(.Down) = SKTexturesAltlas(named: "boyDownWalk")
// player.moveRightTextures = SKTexturesAtlas(named: "boyRightWalk")
// ....
//player.moveToY(25.0)
//player.moveToY(150.0)
//player.moveToY(55.0)

/**
    Possible movment directions for animation
*/
public enum MMMovementDirection: String, Printable {
    case Down = "Down"
    case Left = "Left"
    case Right = "Right"
    case Up = "Up"
    
    public var description: String { get { return self.rawValue } }
}

/** Internal extension to extract textures easier */
internal extension SKTextureAtlas {
    /** Extract all textures in an array */
    var textures: [SKTexture] {
        return map(self.textureNames) { self.textureNamed($0 as! String) }
    }
}

/**
    Animation details and assets
*/
struct MMAnimationAsset {
    let direction: MMMovementDirection
    let textures: [SKTexture]
    
    init(direction: MMMovementDirection, textures: [SKTexture]) {
        self.direction = direction
        self.textures = textures
    }
}

//let playerWalkAnimationAtlas = SKTextureAtlas(named: "boyDownWalk")
//
//
//lazy var playerWalkFrames: [SKTexture] = {
//    let frameNames = self.playerWalkAnimationAtlas.textureNames as! [String]
//    var lazyPlayerWalkFrames = [SKTexture]()
//    
//    for name in frameNames {
//        lazyPlayerWalkFrames.append(
//            self.playerWalkAnimationAtlas.textureNamed(name)
//        )
//    }
//    
//    return lazyPlayerWalkFrames
//    }()
//
//
//let firstFrame = playerWalkFrames.first!
//let player = SKSpriteNode(texture: firstFrame)
//let backgroundImage = SKSpriteNode(imageNamed: "spaceShipBackground")
//
//player.size = CGSizeMake(size.width * 0.8, size.height * 0.6)
//player.position = CGPoint(x: size.width/2, y: size.height/3)
//
//backgroundImage.position = CGPointMake(size.width/2, size.height/2 - 40.0)
//
//
//let playerWalkAction = SKAction.animateWithTextures(playerWalkFrames, timePerFrame: 0.3)
//player.runAction(SKAction.repeatActionForever(playerWalkAction))
//
//self.backgroundColor = SKColor.whiteColor()
//
//addChild(backgroundImage)
//addChild(player)