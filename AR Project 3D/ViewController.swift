//
//  ViewController.swift
//  AR Project 3D
//
//  Created by Matthew Ridley on 6/9/17.
//  Copyright © 2017 Milk Can. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
  @IBOutlet var sceneView: ARSCNView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Set the view's delegate
    sceneView.delegate = self
    
    // Show statistics such as fps and timing information
    sceneView.showsStatistics = true
    
    // Create a new scene
    let scene = SCNScene()
    sceneView.scene = scene
    addMilkCan()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    // Create a session configuration
    let configuration = ARWorldTrackingSessionConfiguration()
    
    // Run the view's session
    sceneView.session.run(configuration)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
    // Pause the view's session
    sceneView.session.pause()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Release any cached data, images, etc that aren't in use.
  }
  
  private func addMilkCan() {
    // Create a new scene
    let milkcan = ViewController.collada2SCNNode(filepath: "milkcan.dae")
    milkcan.position = SCNVector3(0, 0, -0.2)
    sceneView.scene.rootNode.addChildNode(milkcan)
  }
  
  class func collada2SCNNode(filepath:String) -> SCNNode {
    let node = SCNNode()
    let scene = SCNScene(named: filepath)
    let nodeArray = scene!.rootNode.childNodes
    
    for childNode in nodeArray {
      node.addChildNode(childNode as SCNNode)
    }
    
    return node
  }
  
  // MARK: - ARSCNViewDelegate
  
  /*
   // Override to create and configure nodes for anchors added to the view's session.
   func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
   let node = SCNNode()
   
   return node
   }
   */
  
  func session(_ session: ARSession, didFailWithError error: Error) {
    // Present an error message to the user
    
  }
  
  func sessionWasInterrupted(_ session: ARSession) {
    // Inform the user that the session has been interrupted, for example, by presenting an overlay
    
  }
  
  func sessionInterruptionEnded(_ session: ARSession) {
    // Reset tracking and/or remove existing anchors if consistent tracking is required
    
  }
}
