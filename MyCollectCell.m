//
//  MyCollectCell.m
//  HanZiDictionary
//
//  Created by ibokan on 13-6-27.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import "MyCollectCell.h"
#import "ASIHTTPRequest.h"
#import <AVFoundation/AVFoundation.h>
@implementation MyCollectCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.titleLab =[[[UILabel alloc]initWithFrame:CGRectMake(15, 6, 39, 39)]autorelease];
        self.titleLab.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"mizige.png"]];
        [self.titleLab setFont:[UIFont fontWithName:@"Helvetica-Bold" size:23]];
        
        self.titleLab.textAlignment=NSTextAlignmentCenter;
        [self.titleLab setTextColor:[UIColor blackColor]];
        [self.contentView addSubview:self.titleLab];
        
        self.pinYinLab=[[[UILabel alloc]initWithFrame:CGRectMake(65, 6, 120, 18)]autorelease];
        [self.pinYinLab setTextColor:[UIColor colorWithRed:134/255.0 green:63/255.0 blue:41/255.0 alpha:1]];
        self.pinYinLab.backgroundColor=[UIColor clearColor];
        [self.contentView addSubview:self.pinYinLab];
        
        self.buShouLab=[[[UILabel alloc]initWithFrame:CGRectMake(85, 28, 90, 20)]autorelease];
        self.buShouLab.backgroundColor=[UIColor clearColor];
        [self.buShouLab setTextColor:[UIColor colorWithRed:134/255.0 green:63/255.0 blue:41/255.0 alpha:1]];
        [self.contentView addSubview:self.buShouLab];
        
        self.biHuaLab=[[[UILabel alloc]initWithFrame:CGRectMake(210, 28, 100, 20)]autorelease];
        self.biHuaLab.backgroundColor=[UIColor clearColor];
        [self.biHuaLab setTextColor:[UIColor colorWithRed:134/255.0 green:63/255.0 blue:41/255.0 alpha:1]];
        [self.contentView addSubview:self.biHuaLab];
        
        self.round=[UIButton buttonWithType:0];
        self.round.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"loud"]];
        [self.round addTarget:self action:@selector(loud:) forControlEvents:UIControlEventTouchUpInside];
        self.round.frame=CGRectMake(180, 6, 25, 23);
        [self.contentView addSubview:self.round];
    }
    return self;
}
-(void)loud:(id)sender{    
    NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"http://api.ispeech.org/api/rest?apikey=8d1e2e5d3909929860aede288d6b974e&format=mp3&action=convert&voice=chchinesemale&text=%@",self.titleLab.text]];
    ASIHTTPRequest *request=[ASIHTTPRequest requestWithURL:url];
    request.delegate=self;
    [request startAsynchronous];//异步下载
    [request setCompletionBlock:^{
        NSData *sound=[request responseData];
        NSError *error=nil;
        AVAudioPlayer *soundPlay=[[[AVAudioPlayer alloc]initWithData:sound error:&error]autorelease];
        [soundPlay play];
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
