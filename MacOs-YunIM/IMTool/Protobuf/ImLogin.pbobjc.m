// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: IM.Login.proto

// This CPP symbol can be defined to use imports that match up to the framework
// imports needed when using CocoaPods.
#if !defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS)
 #define GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS 0
#endif

#if GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
 #import <Protobuf/GPBProtocolBuffers_RuntimeSupport.h>
#else
 #import "GPBProtocolBuffers_RuntimeSupport.h"
#endif

 #import "ImLogin.pbobjc.h"
 #import "ImBaseDefine.pbobjc.h"
// @@protoc_insertion_point(imports)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

#pragma mark - ImLoginRoot

@implementation ImLoginRoot

+ (GPBExtensionRegistry*)extensionRegistry {
  // This is called by +initialize so there is no need to worry
  // about thread safety and initialization of registry.
  static GPBExtensionRegistry* registry = nil;
  if (!registry) {
    GPBDebugCheckRuntimeVersion();
    registry = [[GPBExtensionRegistry alloc] init];
    [registry addExtensions:[ImBaseDefineRoot extensionRegistry]];
  }
  return registry;
}

@end

#pragma mark - ImLoginRoot_FileDescriptor

static GPBFileDescriptor *ImLoginRoot_FileDescriptor(void) {
  // This is called by +initialize so there is no need to worry
  // about thread safety of the singleton.
  static GPBFileDescriptor *descriptor = NULL;
  if (!descriptor) {
    GPBDebugCheckRuntimeVersion();
    descriptor = [[GPBFileDescriptor alloc] initWithPackage:@"IM.Login"
                                                     syntax:GPBFileSyntaxProto3];
  }
  return descriptor;
}

#pragma mark - IMLoginReq

@implementation IMLoginReq

@dynamic userId;
@dynamic passwd;
@dynamic onlineStatus;
@dynamic clientType;
@dynamic deviceId;
@dynamic clientVersion;
@dynamic token;

typedef struct IMLoginReq__storage_ {
  uint32_t _has_storage_[1];
  UserStatType onlineStatus;
  ClientType clientType;
  NSString *userId;
  NSString *passwd;
  NSString *deviceId;
  NSString *clientVersion;
  NSString *token;
} IMLoginReq__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "userId",
        .dataTypeSpecific.className = NULL,
        .number = IMLoginReq_FieldNumber_UserId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(IMLoginReq__storage_, userId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "passwd",
        .dataTypeSpecific.className = NULL,
        .number = IMLoginReq_FieldNumber_Passwd,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(IMLoginReq__storage_, passwd),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "onlineStatus",
        .dataTypeSpecific.enumDescFunc = UserStatType_EnumDescriptor,
        .number = IMLoginReq_FieldNumber_OnlineStatus,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(IMLoginReq__storage_, onlineStatus),
        .flags = GPBFieldOptional | GPBFieldHasEnumDescriptor,
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "clientType",
        .dataTypeSpecific.enumDescFunc = ClientType_EnumDescriptor,
        .number = IMLoginReq_FieldNumber_ClientType,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(IMLoginReq__storage_, clientType),
        .flags = GPBFieldOptional | GPBFieldHasEnumDescriptor,
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "deviceId",
        .dataTypeSpecific.className = NULL,
        .number = IMLoginReq_FieldNumber_DeviceId,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(IMLoginReq__storage_, deviceId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "clientVersion",
        .dataTypeSpecific.className = NULL,
        .number = IMLoginReq_FieldNumber_ClientVersion,
        .hasIndex = 5,
        .offset = (uint32_t)offsetof(IMLoginReq__storage_, clientVersion),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "token",
        .dataTypeSpecific.className = NULL,
        .number = IMLoginReq_FieldNumber_Token,
        .hasIndex = 6,
        .offset = (uint32_t)offsetof(IMLoginReq__storage_, token),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[IMLoginReq class]
                                     rootClass:[ImLoginRoot class]
                                          file:ImLoginRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(IMLoginReq__storage_)
                                         flags:0];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t IMLoginReq_OnlineStatus_RawValue(IMLoginReq *message) {
  GPBDescriptor *descriptor = [IMLoginReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:IMLoginReq_FieldNumber_OnlineStatus];
  return GPBGetMessageInt32Field(message, field);
}

void SetIMLoginReq_OnlineStatus_RawValue(IMLoginReq *message, int32_t value) {
  GPBDescriptor *descriptor = [IMLoginReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:IMLoginReq_FieldNumber_OnlineStatus];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

int32_t IMLoginReq_ClientType_RawValue(IMLoginReq *message) {
  GPBDescriptor *descriptor = [IMLoginReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:IMLoginReq_FieldNumber_ClientType];
  return GPBGetMessageInt32Field(message, field);
}

void SetIMLoginReq_ClientType_RawValue(IMLoginReq *message, int32_t value) {
  GPBDescriptor *descriptor = [IMLoginReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:IMLoginReq_FieldNumber_ClientType];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - IMLoginRes

@implementation IMLoginRes

@dynamic serverTime;
@dynamic errCode;
@dynamic errMsg;
@dynamic onlineStatus;

typedef struct IMLoginRes__storage_ {
  uint32_t _has_storage_[1];
  uint32_t serverTime;
  ResultType errCode;
  UserStatType onlineStatus;
  NSString *errMsg;
} IMLoginRes__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "serverTime",
        .dataTypeSpecific.className = NULL,
        .number = IMLoginRes_FieldNumber_ServerTime,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(IMLoginRes__storage_, serverTime),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeUInt32,
      },
      {
        .name = "errCode",
        .dataTypeSpecific.enumDescFunc = ResultType_EnumDescriptor,
        .number = IMLoginRes_FieldNumber_ErrCode,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(IMLoginRes__storage_, errCode),
        .flags = GPBFieldOptional | GPBFieldHasEnumDescriptor,
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "errMsg",
        .dataTypeSpecific.className = NULL,
        .number = IMLoginRes_FieldNumber_ErrMsg,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(IMLoginRes__storage_, errMsg),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "onlineStatus",
        .dataTypeSpecific.enumDescFunc = UserStatType_EnumDescriptor,
        .number = IMLoginRes_FieldNumber_OnlineStatus,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(IMLoginRes__storage_, onlineStatus),
        .flags = GPBFieldOptional | GPBFieldHasEnumDescriptor,
        .dataType = GPBDataTypeEnum,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[IMLoginRes class]
                                     rootClass:[ImLoginRoot class]
                                          file:ImLoginRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(IMLoginRes__storage_)
                                         flags:0];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t IMLoginRes_ErrCode_RawValue(IMLoginRes *message) {
  GPBDescriptor *descriptor = [IMLoginRes descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:IMLoginRes_FieldNumber_ErrCode];
  return GPBGetMessageInt32Field(message, field);
}

void SetIMLoginRes_ErrCode_RawValue(IMLoginRes *message, int32_t value) {
  GPBDescriptor *descriptor = [IMLoginRes descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:IMLoginRes_FieldNumber_ErrCode];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

int32_t IMLoginRes_OnlineStatus_RawValue(IMLoginRes *message) {
  GPBDescriptor *descriptor = [IMLoginRes descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:IMLoginRes_FieldNumber_OnlineStatus];
  return GPBGetMessageInt32Field(message, field);
}

void SetIMLoginRes_OnlineStatus_RawValue(IMLoginRes *message, int32_t value) {
  GPBDescriptor *descriptor = [IMLoginRes descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:IMLoginRes_FieldNumber_OnlineStatus];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - IMLogoutReq

@implementation IMLogoutReq


typedef struct IMLogoutReq__storage_ {
  uint32_t _has_storage_[1];
} IMLogoutReq__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[IMLogoutReq class]
                                     rootClass:[ImLoginRoot class]
                                          file:ImLoginRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(IMLogoutReq__storage_)
                                         flags:0];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - IMLogoutRsp

@implementation IMLogoutRsp

@dynamic errCode;

typedef struct IMLogoutRsp__storage_ {
  uint32_t _has_storage_[1];
  uint32_t errCode;
} IMLogoutRsp__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "errCode",
        .dataTypeSpecific.className = NULL,
        .number = IMLogoutRsp_FieldNumber_ErrCode,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(IMLogoutRsp__storage_, errCode),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeUInt32,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[IMLogoutRsp class]
                                     rootClass:[ImLoginRoot class]
                                          file:ImLoginRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(IMLogoutRsp__storage_)
                                         flags:0];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end


#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)
