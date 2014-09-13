#import <Foundation/Foundation.h>

extern NSString *const KIMultipartContentType;

/**
 *  A category to build multipart/form-data -formatted `NSData`.
 *
 *      NSMutableData *body = [[NSMutableData alloc] init];
 *      [body mp_setString:@"bar" forKey:@"foo"];
 *      [body mp_setPNGImage:[UIImage named:@"sample.png"] forKey:@"photo"];
 *
 *      [request setHTTPBody:body]; // NSMutableURLRequest
 *
 *  This request can be represented in JSON like
 *
 *      {
 *          "foo": "bar",
 *          "photo": <Image: sample.png>
 *      }
 *
 *  To perform the request, the header should be set as following where `request` is `NSMutableURLRequest`
 *
 *      [request addValue:KIMultipartContentType forHTTPHeaderField:@"Content-Type"];
 *      [request setHTTPMethod:@"POST"];
 *
 *  Keep in mind you must set `Content-Type`. Otherwise the request will not work properly.
 *
 */
@interface NSMutableData (MultipartFormData)

# pragma mark - Foundation Objects

/**
 *  Appends given NSString into the data in multipart/form-data format.
 *
 *  @param string A value.
 *  @param key    A key paired with the string.
 */
- (void)mp_setString:(NSString *)string forKey:(NSString *)key;

/**
 *  Appends given NSNumber into the data in multipart/form-data format.
 *
 *  @param number A value.
 *  @param key    A key paired with the number.
 */
- (void)mp_setNumber:(NSNumber *)number forKey:(NSString *)key;

# pragma mark - Primitive Numbers

- (void)mp_setInteger:(int)integer forKey:(NSString *)key;
- (void)mp_setLongLong:(long long)longLong forKey:(NSString *)key;
- (void)mp_setFloat:(float)aFloat forKey:(NSString *)key;
- (void)mp_setDouble:(double)aDouble forKey:(NSString *)key;

# pragma mark - Data

- (void)mp_setData:(NSData *)data withFilename:(NSString *)filename forKey:(NSString *)key;

# pragma mark - Data Shorthand (Image)

/**
 *  Appends given image into the data in multipart/form-data format.
 *
 *  @param image   An image you want to append.
 *  @param quality JPEG compression quality between 0.0f ~ 1.0f.
 *  @param key     A key paired with the value.
 */
- (void)mp_setJPEGImage:(UIImage *)image withQuality:(CGFloat)quality forKey:(NSString *)key;

/**
 *  Appends given image into the data in multipart/form-data format.
 *
 *  @param image    An image you want to append.
 *  @param quality  JPEG compression quality between 0.0f ~ 1.0f.
 *  @param filename A name represent the image.
 *  @param key      A key paired with the value.
 */
- (void)mp_setJPEGImage:(UIImage *)image withQuality:(CGFloat)quality withFilename:(NSString *)filename forKey:(NSString *)key;

- (void)mp_setPNGImage:(UIImage *)image forKey:(NSString *)key;
- (void)mp_setPNGImage:(UIImage *)image withFilename:(NSString *)filename forKey:(NSString *)key;

# pragma mark - Debugging Utilities

- (NSString *)mp_stringRepresentation;

@end
