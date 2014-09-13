// References:
//   The Multipart Content-Type - http://www.w3.org/Protocols/rfc1341/7_2_Multipart.html
//   Sending Multipart Forms with Objective-C - http://nthn.me/posts/2012/objc-multipart-forms.html

#import "NSMutableData+MultipartFormData.h"

NSString *const KIMultipartBoundary = @"KIBoundary";
NSString *const KIMultipartContentType = @"multipart/form-data; boundary=KIBoundary";

@implementation NSMutableData (MultipartFormData)

# pragma mark - Foundation Objects

- (void)mp_setString:(NSString *)string forKey:(NSString *)key {
    [self mp_setBoundary];
    [self appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n%@", key, string] dataUsingEncoding:NSUTF8StringEncoding]];
}

- (void)mp_setNumber:(NSNumber *)number forKey:(NSString *)key {
    [self mp_setBoundary];
    [self appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n%@", key, number] dataUsingEncoding:NSUTF8StringEncoding]];
}

# pragma mark - Primitive Numbers

- (void)mp_setInteger:(int)integer forKey:(NSString *)key {
    [self mp_setBoundary];
    [self appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n%d", key, integer] dataUsingEncoding:NSUTF8StringEncoding]];
}

- (void)mp_setLongLong:(long long)longLong forKey:(NSString *)key {
    [self mp_setBoundary];
    [self appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n%lld", key, longLong] dataUsingEncoding:NSUTF8StringEncoding]];
}

- (void)mp_setFloat:(float)aFloat forKey:(NSString *)key {
    [self mp_setBoundary];
    [self appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n%f", key, aFloat] dataUsingEncoding:NSUTF8StringEncoding]];
}

- (void)mp_setDouble:(double)aDouble forKey:(NSString *)key {
    [self mp_setBoundary];
    [self appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n%f", key, aDouble] dataUsingEncoding:NSUTF8StringEncoding]];
}

# pragma mark - Data

- (void)mp_setData:(NSData *)data forKey:(NSString *)key {
    NSString *filename = [self mp_uniqueName];
    
    [self mp_setData:data withFilename:filename forKey:key];
}

- (void)mp_setData:(NSData *)data withFilename:(NSString *)filename forKey:(NSString *)key {
    [self mp_setBoundary];
    [self appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\n", key, filename] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [self mp_setOctetStreamContentType];
    [self appendData:[NSData dataWithData:data]];
}

# pragma mark - Data Shorthand

- (void)mp_setJPEGImage:(UIImage *)image withQuality:(CGFloat)quality forKey:(NSString *)key {
    NSString *filename = [NSString stringWithFormat:@"%@.jpg", [self mp_uniqueName]];
    
    [self mp_setJPEGImage:image withQuality:quality withFilename:filename forKey:key];
}

- (void)mp_setJPEGImage:(UIImage *)image withQuality:(CGFloat)quality withFilename:(NSString *)filename forKey:(NSString *)key {
    NSData *imageData = UIImageJPEGRepresentation(image, quality);
    
    [self mp_setData:imageData withFilename:filename forKey:key];
}

- (void)mp_setPNGImage:(UIImage *)image forKey:(NSString *)key {
    NSString *filename = [NSString stringWithFormat:@"%@.png", [self mp_uniqueName]];
    
    [self mp_setPNGImage:image withFilename:filename forKey:key];
}

- (void)mp_setPNGImage:(UIImage *)image withFilename:(NSString *)filename forKey:(NSString *)key {
    NSData *imageData = UIImagePNGRepresentation(image);
    
    [self mp_setData:imageData withFilename:filename forKey:key];
}

# pragma mark - Helpers

- (NSString *)mp_uniqueName {
    return [[NSUUID new] UUIDString];
}

- (void)mp_setBoundary {
    [self appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", KIMultipartBoundary] dataUsingEncoding:NSUTF8StringEncoding]];
}

- (void)mp_setOctetStreamContentType {
    [self appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
}

# pragma mark - Debugging Utilities

- (NSString *)mp_stringRepresentation {
    return [[NSString alloc] initWithData:self encoding:NSASCIIStringEncoding];
}

@end
