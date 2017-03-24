//
//  AsynImage.swift
//  FoodCR2
//
//  Created by Rafael Reyes on 3/9/17.
//  Copyright © 2017 rafa. All rights reserved.
//

import Foundation


class AsynImage{
    
    private var ImgArray = [String]()
    
    public func DownloadImage()
    {
        LoadArray()
        for img in ImgArray {
            if let checkedUrl = NSURL(string: img) {
                //imageView.contentMode = .ScaleAspectFit
                DownloadImage(url: checkedUrl)
            }else{
                print("Imagen no checked: " + img)
            }
        }
    }
    
    func DownloadImage(url: NSURL){
        print("Download Started")
        print("lastPathComponent: " + (url.lastPathComponent ?? ""))
        
        getDataFromUrl(url: url) { (data, response, error)  in
            DispatchQueue.main.async {
                guard let data = data, error == nil else { return }
                print(response?.suggestedFilename ?? "")
                print("Download Finished")
                _ = UIImage(data: data as Data)
                _ = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
                let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
                if let image = UIImage(data: data as Data) {
                    let fileURL = documentsURL.appendingPathComponent(String(describing: response?.suggestedFilename))
                    if let pngImageData = UIImagePNGRepresentation(image) {
                        try! pngImageData.write(to: fileURL, options: .atomic)
                    }
                }
            }
        }
    }
    
    func getDataFromUrl(url:NSURL, completion: @escaping ((_ data: NSData?, _ response: URLResponse?, _ error: NSError? ) -> Void)) {
        URLSession.shared.dataTask(with: url as URL) { (data, response, error) in
            completion(data as NSData?, response, error as NSError?)
            }.resume()
    }
    
    
    func LoadArray(){
        ImgArray = ["http://imagenpng.com/wp-content/uploads/2015/09/00perro-256x213.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/00perro-68x63.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/00perro.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/1211762150.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/1211810004.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/15-de-septiembre-noche-del-grito-6.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/29PNG.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/32.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/7.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/87374826f991a03fd2723ad99a7db8ffo.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/ADORNOS-361.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/Bowser_Jr._-_MSOWG_transparente.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/BrusheTainaraRegina-5.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/DollPart18_zpsbba110ac.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/Fios_de_luz-Designer_photoscap.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/Hermanos_Mario_MLSS.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/INDEPENDENCIA-DE-MEXICO.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/Imagenn-PNG.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/PNG_transparency_demonstration_1.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/Paint_Splash_PNG_by_AbsurdWordPreferred.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/Paper_mario.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/RVL_DKCReturns.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/Sr.Zurkon_transparente.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/Tumblr_inline_mpzute69xx1qz4rgp.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/actor-02-256x341.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/actor-02.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/brush_png_1_by_sarismiler-d5dgupe.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/brush_png_by_swaggynats-d5p4nej.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/cmm101260257-4.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/colores-facebook-portada.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/descarga.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/despicable-me-574945-1680x1050-0.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/despicable-me-574945-1680x1050-012.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/despicable-me-575065-1600x1200-2.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/despicable-me-575065-1680x1050-0.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/dibujos-monos-pintar.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/elem-22.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/elsa-de-frozen_2.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/escudo-hi.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/estrellas-con-efectospng-10.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/frozen-elsa-y-anna_2.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/frozen-elsa_2.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/huella3.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/imagenes-png-256x205.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/imagenes-png-300x225.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/imagenes-png-635x508.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/imagenes-png-68x63.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/imagenes-png.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/imagens-png-shrek-11.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/images-1.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/images-11.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/images-2.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/images-21.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/images-3.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/images-4.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/images-5.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/images-6.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/images.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/images1.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/jewelry_PNG6803.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/large-1.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/large.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/mapa-mexico-estados-nombres.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/mickey-mouse-en-png.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/notas-256x254.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/notas-300x225.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/notas-68x63.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/notas.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/nuevo-logo-google-2015-0.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/nuevo-logo-google-2015-3.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/pluto-disnet-en-png.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/png_monsters_inc_by_upinflames12-d63nx7i.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/pngyaya.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/purplek.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/rosas-png-1.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/rose_2.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/transparente_by_eliseoeli-d40zcu1-256x352.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/transparente_by_eliseoeli-d40zcu1-68x63.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/transparente_by_eliseoeli-d40zcu1.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/tumblr_inline_mpzut5eifH1qz4rgp.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/tumblr_inline_mq1nqiBIi01qz4rgp.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/tumblr_inline_mq1nrsHG3I1qz4rgp.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/tumblr_inline_mq1nxjDtN31qz4rgp.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/tumblr_inline_mq1o4a5NFx1qz4rgp.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/tumblr_inline_mqviq1eR2e1qz4rgp.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/tumblr_inline_nfv5o80wSz1rclfv1.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/tumblr_mmlqcd4mWY1s9yt1no1_500.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/tumblr_mqglbkJpmj1sae1m0o1_500.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/tumblr_nq74g2ZN221upc6r9o1_1280.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/tumblr_nrpdylvZjm1tgn60so1_500.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/tumblr_static_d03c8hu9in4gwow00044ookw0.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/tumblr_static_gjdsa.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/tumblr_text_by_throughtthedarknes-d79byjz.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/ztumblr_inline_mq2iyyvbqb1qz4rgp-256x298.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/ztumblr_inline_mq2iyyvbqb1qz4rgp-68x63.png",
                    "http://imagenpng.com/wp-content/uploads/2015/09/ztumblr_inline_mq2iyyvbqb1qz4rgp.png"]
    }
}
