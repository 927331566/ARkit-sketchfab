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
        sceneView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.width)
        sceneView.accessibilityViewIsModal = false
        sceneView.isUserInteractionEnabled = true
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

        
        
        // Add lighting to the scene
        let lightNode3 = SCNNode()
        //lightNode.geometry?.firstMaterial?.diffuse.contents = UIColor.white
        lightNode3.light = SCNLight()
        //lightNode.light?.color = UIColor.
        lightNode3.light?.type = .directional
        lightNode3.position = SCNVector3(x: 10, y: 0, z: 10)
        scene.rootNode.addChildNode(lightNode3)
        
        
        // Configure the SceneKit view
        sceneView.backgroundColor = UIColor.white
        sceneView.allowsCameraControl = true
        sceneView.showsStatistics = true
        
//        let aaa = SCNMaterial()
//        aaa.diffuse.contents = UIColor.red
//        lightNode.geometry?.firstMaterial = aaa
        
        // 创建一个捏合手势识别器
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(_:)))
        sceneView.addGestureRecognizer(pinchGesture)
        // Do any additional setup after loading the view.
    }
    @objc func handlePinch(_ gestureRecognizer: UIPinchGestureRecognizer) {
            // 获取当前场景视图上所有节点的根节点
        guard let rootNode = sceneView.scene?.rootNode else { return }
        // 捏合手势的比例系数表示缩放比例，可以提供给根节点的缩放属性来改变它的大小
        let pinchScaleX = Float(gestureRecognizer.scale) * rootNode.scale.x
        let pinchScaleY = Float(gestureRecognizer.scale) * rootNode.scale.y
        let pinchScaleZ = Float(gestureRecognizer.scale) * rootNode.scale.z
        rootNode.scale = SCNVector3(pinchScaleX, pinchScaleY, pinchScaleZ)

            // 重置缩放比例以便于下次计算
        gestureRecognizer.scale = 1
        
        
        print("Pinch gesture recognized!")
    }
}

