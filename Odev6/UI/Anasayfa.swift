//
//  ViewController.swift
//  Odev6
//
//  Created by Furkan Eren on 21.12.2023.
//

import UIKit

class Anasayfa: UIViewController {

    @IBOutlet weak var collectionUrunler: UICollectionView!
    var urunlerListesi = [urunler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Getir"
        
        let barapperance = UINavigationBarAppearance()
        
        barapperance.backgroundColor = UIColor(named: "arkaPlan")
        barapperance.titleTextAttributes = [.foregroundColor : UIColor(named :"BaslikRenk")!,.font : UIFont(name: "BreeSerif-Regular", size: 22)!]
        
//        şarj göstergesinin olduğu kısmı siyah temaya çevirmek
        navigationController?.navigationBar.barStyle = .black
//        Farklı görünümlü apple ürünleri için appereance lar
        navigationController?.navigationBar.standardAppearance = barapperance
        navigationController?.navigationBar.compactAppearance = barapperance
        navigationController?.navigationBar.scrollEdgeAppearance = barapperance
        
       
        
        
        collectionUrunler.delegate = self
        collectionUrunler.dataSource = self
         
       
        let s1 = urunler(id: 1, ad: "Yeni Yıla Özel", resim:"yeniYilaÖzel")
        let s2 = urunler(id: 2, ad: "Süper İkili", resim:"superİkili")
        let s3 = urunler(id: 3, ad: "Yılın Yıldızları", resim:"yilinYildizlari")
        let s4 = urunler(id: 4, ad: "İndirimler", resim:"indirimler")
        let s5 = urunler(id: 5, ad: " Su & İçecek", resim:"suveiçecek")
        let s6 = urunler(id: 6, ad: "  Meyve & Sebze", resim: "meyveSebze")
        let s7 = urunler(id: 7, ad: "Fırından", resim: "Fırından")
        let s8 = urunler(id: 8, ad: "Süt Ürünleri", resim: "Sut_Urunleri")
        let s9 = urunler(id: 9, ad: "Atıştırmalık", resim: "Atistirmalik")
        let s10 = urunler(id: 10, ad: "Dondurma", resim: "dondurma")
        let s11 = urunler(id: 11, ad: "Temel Gıda", resim: "temel_gida")
        let s12 = urunler(id: 12, ad: "Kahvaltılık", resim: "kahvaltilik")
        let s13 = urunler(id: 13, ad: "Yiyecek", resim: "yiyecek")
        let s14 = urunler(id: 14, ad: "Fit & Form", resim: "fit_Form")
        let s15 = urunler(id: 15, ad: "Kişisel Bakım", resim: "kisisel_Bakim")
        let s16 = urunler(id: 16, ad: "Ev Bakım", resim: "Ev_Bakim")
        let s17 = urunler(id: 17, ad: "Ev & Yaşam", resim: "Ev_Yasam")
        let s18 = urunler(id: 18, ad: "Teknoloji", resim: "teknoloji")
        let s19 = urunler(id: 19, ad: "Evcil Hayvan", resim: "Evcil_Hayvan")
        let s20 = urunler(id: 20, ad: "Bebek", resim: "bebek")
        urunlerListesi.append(s1)
        urunlerListesi.append(s2)
        urunlerListesi.append(s3)
        urunlerListesi.append(s4)
        urunlerListesi.append(s5)
        urunlerListesi.append(s6)
        urunlerListesi.append(s7)
        urunlerListesi.append(s8)
        urunlerListesi.append(s9)
        urunlerListesi.append(s10)
        urunlerListesi.append(s11)
        urunlerListesi.append(s12)
        urunlerListesi.append(s13)
        urunlerListesi.append(s14)
        urunlerListesi.append(s15)
        urunlerListesi.append(s16)
        urunlerListesi.append(s17)
        urunlerListesi.append(s18)
        urunlerListesi.append(s19)
        urunlerListesi.append(s20)
        
        let tasarim = UICollectionViewFlowLayout()
        tasarim.sectionInset = UIEdgeInsets(top: 11, left: 1, bottom: 20, right:1)
        tasarim.minimumInteritemSpacing = 5
        tasarim.minimumLineSpacing = 5
        
        let ekranGenislik = UIScreen.main.bounds.width
        let itemGenislik = (ekranGenislik - 20)/4
        tasarim.itemSize = CGSize(width: itemGenislik  , height: itemGenislik * 1.2
        )
        collectionUrunler.collectionViewLayout = tasarim
        
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = .white
        
        renkDegistir(itemAppearance: appearance.stackedLayoutAppearance)
        renkDegistir(itemAppearance: appearance.compactInlineLayoutAppearance)
        renkDegistir(itemAppearance: appearance.inlineLayoutAppearance)
       
        
        tabBarController?.tabBar.standardAppearance = appearance
        tabBarController?.tabBar.scrollEdgeAppearance = appearance
        
        
        func renkDegistir(itemAppearance:UITabBarItemAppearance){
            
            //Seçili olduğu durumda tabbar
            itemAppearance.selected.iconColor = UIColor.systemPurple
            itemAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.systemPurple]
            itemAppearance.selected.badgeBackgroundColor = .systemMint
            
            //Seçili olmadığı durumda tabbar
            itemAppearance.normal.iconColor = .gray
            itemAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.gray]
            itemAppearance.normal.badgeBackgroundColor = .lightGray
            
        }
    }
}

extension Anasayfa : UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return urunlerListesi.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let urun = urunlerListesi[indexPath.row]
        
        let hucre = collectionView.dequeueReusableCell(withReuseIdentifier: "urunlerHucre", for: indexPath) as! urunlerHucre //Downcasting
        hucre.imageViewResim.image = UIImage(named: urun.resim!)
        hucre.labelAd.text = "\(urun.ad!)"
        
        hucre.layer.cornerRadius = 10
        hucre.layer.borderWidth = 0.15
        
        hucre.layer.borderColor = UIColor.lightGray.cgColor
        
        return hucre
    }
    
   
    
    
}
