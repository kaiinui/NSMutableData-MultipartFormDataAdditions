#import <Foundation/Foundation.h>

@interface NSMutableData (MultipartFormData)


- (void)mp_setString:(NSString *)string forKey:(NSString *)key;
- (void)mp_setNumber:(NSNumber *)number forKey:(NSString *)key;

# pragma mark - Primitive Numbers

- (void)mp_setInteger:(int)integer forKey:(NSString *)key;
- (void)mp_setLongLong:(long long)longLong forKey:(NSString *)key;
- (void)mp_setFloat:(float)aFloat forKey:(NSString *)key;
- (void)mp_setDouble:(double)aDouble forKey:(NSString *)key;

# pragma mark - Data

- (void)mp_setData:(NSData *)data withFilename:(NSString *)filename forKey:(NSString *)key;

# pragma mark - Data Shorthand (Image)

- (void)mp_setJPEGImage:(UIImage *)image withQuality:(CGFloat)quality forKey:(NSString *)key;
- (void)mp_setJPEGImage:(UIImage *)image withQuality:(CGFloat)quality withFilename:(NSString *)filename forKey:(NSString *)key;

- (void)mp_setPNGImage:(UIImage *)image forKey:(NSString *)key;
- (void)mp_setPNGImage:(UIImage *)image withFilename:(NSString *)filename forKey:(NSString *)key;

# pragma mark - Debugging Utiliry

- (NSString *)mp_stringRepresentation;

@end
