//
//  RecordSoundsViewController.swift
//  PitchPerfect
//
//  Created by Floyd Chen on 1/12/18.
//  Copyright © 2018 Floyd Chen. All rights reserved.
//

import UIKit
import AVFoundation

// conform to AVAudioRecorderDelegate protocal, the delegate of an AVAudioRecorder object
class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {
    
    var audioRecorder: AVAudioRecorder!
    
    // recordingLabel是变量名字
    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        stopRecordingButton.isEnabled = false
    }
    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear()
        print("viewWillAppear called")
    }

    @IBAction func recordAudio(_ sender: AnyObject) {
        recordingLabel.text = "Recording in progress"
        stopRecordingButton.isEnabled = true
        recordButton.isEnabled = false
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav" // file name of the recorded audio file
        let pathArray = [dirPath, recordingName] // use an array to combine dir path and file name
        let filePath = URL(string: pathArray.joined(separator: "/")) // combined url
//        print(filePath)
        
        let session = AVAudioSession.sharedInstance() // the one shared audio recorder used by all apps on the phone
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with:AVAudioSessionCategoryOptions.defaultToSpeaker) // try!: does not handle errors
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self // set this view controller as the delegate of AVAudioRecorder
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    @IBAction func stopRecording(_ sender: Any) {
//        print("stop recording button was pressed")
        stopRecordingButton.isEnabled = false
        recordButton.isEnabled = true
        recordingLabel.text = "Tap to Record"
        audioRecorder.stop() // stop the recorder
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false) // share the session to inactive
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag {
            performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
        } else {
            print("recording was not successful")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "stopRecording" {
            let palySoundsVC = segue.destination as! PlaySoundsViewController // destination VC, forced upcast
            let recordedAudioURL = sender as! URL
            palySoundsVC.recordedAudioURL  = recordedAudioURL
        }
    }
    
}

