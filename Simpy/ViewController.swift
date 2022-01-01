//
//  ViewController.swift
//  Simpy
//
//  Created by Sanjeeb Samanta on 29/12/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var songs = [Song]()
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        configureSongs()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func configureSongs(){
        songs.append(Song(name: "Do Chaar Din", albumName: "T Series", trackName: "song2", artistName: "Rahul Vadiya", imageName: "do chaar"))
        songs.append(Song(name: "Tum Saath Ho", albumName: "T Series", trackName: "song3", artistName: "Arijit Singh", imageName: "images"))
        songs.append(Song(name: "Ek Raat", albumName: "T Series", trackName: "song1", artistName: "Vilen", imageName: "ek raat"))
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let song = songs[indexPath.row]
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.albumName
        cell.imageView?.image = UIImage(named: song.imageName)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 18)
        cell.detailTextLabel?.font = UIFont(name: "Helvetica", size: 17)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let position = indexPath.row
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "player") as? PlayerViewController else{
            return
        }
        vc.songs = songs
        vc.position = position
        present(vc, animated: true)
    }

}


struct Song{
    let name: String
    let albumName: String
    let trackName: String
    let artistName: String
    let imageName: String
}

