//
//  FoodCollectionViewCell.swift
//  FoodCR2
//
//  Created by Cristian Fernandez on 3/9/17.
//  Copyright © 2017 rafa. All rights reserved.
//


protocol FoodCollectionViewCellDelegate
{
    //func deletePublisher(publisher: Publisher)
}

class FoodCollectionViewCell: UICollectionViewCell
{

    @IBOutlet weak var foodImageView: UIImageView!
 
    @IBOutlet weak var foodNameLabel: UILabel!
    
}
