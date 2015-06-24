//
//  DetailViewController.h
//  Mantle+JSONTransformerExtension
//
//  Created by chenxiancai on 6/24/15.
//  Copyright (c) 2015 chenxiancai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

