//
//  ViewController.swift
//  ImageDownloader
//
//  Created by Devesh Rawat on 12/10/17.
//  Copyright © 2017 vishal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let imageUrlArray = ["http://www.nikon.co.in/tmp/IN/2419865273/3760176746/3397962923/838133548/4043737636/850535102/542011102/122021059/2815570327.jpg",
                         "http://www.nikon.co.in/pages/in/articles/109/babi_nobis.jpg",
                         "http://www.nikon.co.in/tmp/IN/2419865273/3760176746/2586568015/286546384/3855120363/4043737636/542011102/122021059/2166022808.jpg",
                         "http://www.nikon.co.in/tmp/IN/2419865273/3760176746/3397962923/838133548/4043737636/850535102/542011102/122021059/685075260.jpg",
                         "http://www.nikon.co.in/pages/in/articles/109/krishnan_v.jpg",
                         "http://www.nikon.co.in/pages/in/articles/109/thakur_dalip_singh.jpg",
                         "http://www.nikon.co.in/pages/in/articles/109/tushar_kanti_dutta.jpg",
                         "https://cdn.photographylife.com/wp-content/uploads/2012/03/Canon-5D-Mark-III-Image-Sample-1-960x640.jpg",
                         "https://cdn.photographylife.com/wp-content/uploads/2012/03/Canon-5D-Mark-III-Image-Sample-3-e1330673643114-640x960.jpg",
                         "https://cdn.photographylife.com/wp-content/uploads/2012/03/Canon-5D-Mark-III-Image-Sample-4-960x640.jpg",
                         "https://cdn.photographylife.com/wp-content/uploads/2012/03/Canon-5D-Mark-III-Image-Sample-5-e1330673622829-640x960.jpg",
                         "https://www.apple.com/euro/ios/ios8/a/generic/images/og.png",
                         "https://cdn.photographylife.com/wp-content/uploads/2012/03/Canon-5D-Mark-III-Image-Sample-6-e1330673592390-640x960.jpg",
                         "https://cdn.photographylife.com/wp-content/uploads/2012/03/Canon-5D-Mark-III-Image-Sample-7-960x640.jpg",
                         "https://cdn.photographylife.com/wp-content/uploads/2012/03/Canon-5D-Mark-III-Image-Sample-8-960x640.jpg",
                         "https://cdn.photographylife.com/wp-content/uploads/2012/03/Canon-5D-Mark-III-Image-Sample-9-960x640.jpg",
                         "https://cdn.photographylife.com/wp-content/uploads/2012/03/Canon-5D-Mark-III-Image-Sample-10-960x640.jpg",
                         "https://cdn.photographylife.com/wp-content/uploads/2012/03/Canon-5D-Mark-III-Image-Sample-11-960x640.jpg",
                         "https://cdn.photographylife.com/wp-content/uploads/2012/03/Canon-5D-Mark-III-Image-Sample-12-960x640.jpg",
                         "https://cdn.photographylife.com/wp-content/uploads/2012/03/Canon-5D-Mark-III-Image-Sample-13-e1331234219159-640x960.jpg",
                         "https://cdn.photographylife.com/wp-content/uploads/2012/03/Canon-5D-Mark-III-Image-Sample-14-960x640.jpg",
                         "https://cdn.photographylife.com/wp-content/uploads/2012/03/Canon-5D-Mark-III-Image-Sample-15-e1331234233360-640x960.jpg",
                         "https://upload.wikimedia.org/wikipedia/commons/1/17/MARTAKIS1.jpg",
                         "https://i.imgur.com/w6FLAiM.png",
                         "https://i.imgur.com/MSD3DIQ.png",
                         "https://i.imgur.com/QmoRyat.png",
                         "https://i.imgur.com/idWP2pk.png",
                         "https://i.imgur.com/FXiyFKX.png",
                         "https://i.imgur.com/G0Zh6Bm.png",
                         "https://i.imgur.com/9tfXEgH.jpg",
                         "http://i.imgur.com/w5rkSIj.jpg",
                         "https://www.apple.com/euro/ios/ios8/a/generic/images/og.png",
                         "https://i.imgur.com/39TC9DXg.jpg",
                         "https://i.imgur.com/w6FLAiM.png",
                         "https://i.imgur.com/MSD3DIQ.png",
                         "https://i.imgur.com/QmoRyat.png",
                         "https://i.imgur.com/idWP2pk.png",
                         "https://i.imgur.com/FXiyFKX.png",
                         "https://i.imgur.com/G0Zh6Bm.png",
                         "https://i.imgur.com/9tfXEgH.jpg",
                         "http://i.imgur.com/w5rkSIj.jpg",
                         "https://www.apple.com/euro/ios/ios8/a/generic/images/og.png",
                         "https://i.imgur.com/39TC9DXg.jpg",
                         "https://i.imgur.com/w6FLAiM.png",
                         "https://i.imgur.com/MSD3DIQ.png",
                         "https://i.imgur.com/QmoRyat.png",
                         "https://i.imgur.com/idWP2pk.png",
                         "https://i.imgur.com/FXiyFKX.png",
                         "https://i.imgur.com/G0Zh6Bm.png",
                         "https://i.imgur.com/9tfXEgH.jpg"]

    @IBOutlet weak var tblImage: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    


}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ImageTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell") as! ImageTableViewCell
       // cell.imgBackground.setImageFromUrl(imageUrl: imageUrlArray[indexPath.row])
        cell.imgBackground.setImageFromUrl(imageUrl: imageUrlArray[indexPath.row], placeholderImage: UIImage(named: "back")!)
        cell.layer.borderWidth = 2
        cell.layer.borderColor = UIColor.black.cgColor
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let fullImageVC = mainStoryboard.instantiateViewController(withIdentifier: "FullIImageViewController") as! FullIImageViewController
        fullImageVC.imageUrl = imageUrlArray[indexPath.row]
        self.navigationController?.pushViewController(fullImageVC, animated: true)
    }
}





