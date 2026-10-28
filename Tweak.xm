#import <UIKit/UIKit.h>
#import <objc/runtime.h>

static char demoLabelKey;

%hook SBFLockScreenDateView

- (void)layoutSubviews {
    %orig;

    UILabel *label = objc_getAssociatedObject(
        self, &demoLabelKey
    );

    if (!label) {
        label = [[UILabel alloc] initWithFrame:CGRectZero];
        label.text = @"FaceID2D • Démo";
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:12];
        label.userInteractionEnabled = NO;

        [self addSubview:label];

        objc_setAssociatedObject(
            self, &demoLabelKey, label,
            OBJC_ASSOCIATION_RETAIN_NONATOMIC
        );
    }

    label.frame = CGRectMake(
        0, CGRectGetHeight(self.bounds) + 2,
        CGRectGetWidth(self.bounds), 18
    );
}

%end
