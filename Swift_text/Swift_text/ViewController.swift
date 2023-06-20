//
//  ViewController.swift
//  Swift_text
//
//  Created by 王璐 on 2023/6/13.
//

import UIKit
import ARKit
import SceneKit
class ViewController: UIViewController, ARSCNViewDelegate {

    var sceneView: SCNView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.gray
        // Create a new SceneKit view
        sceneView = SCNView()
        sceneView.frame = view.bounds
        sceneView.accessibilityViewIsModal = false
        sceneView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(sceneView)

        // Load the USDZ model file and add it to the scene
        guard let usdzURL = Bundle.main.url(forResource: "Greek_Temple", withExtension: "usdz") else { return }
        let scene = try! SCNScene(url: usdzURL, options: nil)
        sceneView.scene = scene

        
        
        // Add lighting to the scene
        let lightNode = SCNNode()
        //lightNode.geometry?.firstMaterial?.diffuse.contents = UIColor.white
        lightNode.light = SCNLight()
        //lightNode.light?.color = UIColor.
        lightNode.light?.type = .directional
        lightNode.position = SCNVector3(x: 0, y: 0, z: 0)
        scene.rootNode.addChildNode(lightNode)
        
        
        
        
        let lightNode2 = SCNNode()
        //lightNode2.geometry?.firstMaterial?.diffuse.contents = UIColor.white
        lightNode2.light = SCNLight()
        //lightNode.light?.color = UIColor.
        lightNode2.light?.type = .directional
        lightNode2.position = SCNVector3(x: 10, y: 10, z: 10)
        scene.rootNode.addChildNode(lightNode2)

        // Configure the SceneKit view
        sceneView.backgroundColor = UIColor.white
        sceneView.allowsCameraControl = true
        sceneView.showsStatistics = true
        
//        let aaa = SCNMaterial()
//        aaa.diffuse.contents = UIColor.red
//        lightNode.geometry?.firstMaterial = aaa
        

        // Do any additional setup after loading the view.
    }


}

