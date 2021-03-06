//
//  ProjectAboutMeListCell.m
//  ws_coding
//
//  Created by ws on 16/9/6.
//  Copyright © 2016年 ws. All rights reserved.
//

#define kIconSize 80
#define kSwapBtnWidth 135
#define kLeftOffset 20
#define kPinSize 22

#import "ProjectAboutMeListCell.h"

@interface ProjectAboutMeListCell ()
@property (nonatomic, strong) UIImageView *projectIconView, *privateIconView, *pinIconView;//cell的图片
@property (nonatomic, strong) UILabel *projectTitleLabel, *ownerTitleLabel, *describeLabel;//cell的title
@property (nonatomic, strong) UIButton *setCommonBtn;

@end

@implementation ProjectAboutMeListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor clearColor];
        
        if (!_projectIconView) {
            _projectIconView = [[UIImageView alloc] initWithFrame:CGRectMake(12, 12, kIconSize, kIconSize)];
            _projectIconView.layer.cornerRadius = 2;
            _projectIconView.layer.masksToBounds = YES;
            [self.contentView addSubview:_projectIconView];
        }
        
        if (!_projectTitleLabel) {
            _projectTitleLabel = [UILabel new];
            _projectTitleLabel.textColor = [UIColor colorWithHexString:@"0x222222"];
            _projectTitleLabel.font = [UIFont systemFontOfSize:17];
            [self.contentView addSubview:_projectTitleLabel];
        }
        
        if (!_ownerTitleLabel) {
            _ownerTitleLabel = [UILabel new];
            _ownerTitleLabel.textColor = [UIColor colorWithHexString:@"0x999999"];
            _ownerTitleLabel.font = [UIFont systemFontOfSize:15];
            [self.contentView addSubview:_ownerTitleLabel];
        }
        
        if (!_describeLabel) {
            _describeLabel = [UILabel new];
            _describeLabel.textColor = [UIColor colorWithHexString:@"0x666666"];
            _describeLabel.font = [UIFont systemFontOfSize:14];
            _describeLabel.numberOfLines=1;
            [self.contentView addSubview:_describeLabel];
        }
        
        if (!_privateIconView) {
            _privateIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_project_private"]];
            _privateIconView.hidden = YES;
            [self.contentView addSubview:_privateIconView];
        }
        
        if (!_pinIconView) {
            _pinIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_project_cell_setNormal"]];
            _pinIconView.hidden = YES;
            [self.contentView addSubview:_pinIconView];
            [_pinIconView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(kPinSize, kPinSize));
                make.right.equalTo(self.projectIconView).offset(-5);
                make.top.equalTo(self.projectIconView).offset(6);
            }];
        }
        
        if (!_setCommonBtn) {
            _setCommonBtn = [UIButton new];
            _setCommonBtn.hidden = YES;
            [_setCommonBtn setBackgroundColor:[UIColor grayColor]];
            //for test
            [_setCommonBtn setImage:[UIImage imageNamed:@"btn_setFrequent"] forState:UIControlStateNormal];
            [self.contentView addSubview:_setCommonBtn];
            [_setCommonBtn addTarget:self action:@selector(showSliderAction) forControlEvents:UIControlEventTouchUpInside];
            [_setCommonBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(35, 20));
                make.right.equalTo(self).offset(-15+11);
                make.bottom.equalTo(self.projectIconView).offset(5);
            }];
        }
        
    }
    return self;
}

#pragma mark set
- (void)setProject:(Project *)pro{
    if (!pro) {
        return;
    }
    //Icon
    [_projectIconView sd_setImageWithURL:[pro.icon urlImageWithCodePathResizeToView:_projectIconView] placeholderImage:kPlaceholderCodingSquareWidth(55.0)];
    _privateIconView.hidden =(pro.is_public!=nil)? pro.is_public.boolValue:([pro.type intValue]==2)?FALSE:TRUE;
//    if (_hidePrivateIcon) {
//        _privateIconView.hidden=TRUE;
//    }
    
    [_privateIconView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(_privateIconView.hidden?CGSizeZero:CGSizeMake(12, 12));
        make.centerY.equalTo(_projectTitleLabel.mas_centerY);
        make.left.equalTo(_projectIconView.mas_right).offset(kLeftOffset);
    }];
    
    [_projectTitleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_projectIconView.mas_top);
        make.height.equalTo(@(20));
        make.left.equalTo(_privateIconView.mas_right).offset(_privateIconView.hidden?0:8);
        make.right.lessThanOrEqualTo(self.mas_right).offset(-12);
    }];
    
    [_ownerTitleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.height.equalTo(self.projectTitleLabel);
        make.left.equalTo(self.privateIconView);
        make.bottom.equalTo(_projectIconView.mas_bottom);
    }];
    
    [_describeLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.privateIconView);
        make.height.equalTo(@(38));
        make.width.equalTo(@(kScreen_Width-kLeftOffset-kIconSize-20));
        make.top.equalTo(_projectTitleLabel.mas_bottom);
    }];

    _projectTitleLabel.text = pro.name;
    _describeLabel.text = pro.description_mine;
    _ownerTitleLabel.text = pro.owner_user_name;
}

#pragma mark button action
- (void)showSliderAction{
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
