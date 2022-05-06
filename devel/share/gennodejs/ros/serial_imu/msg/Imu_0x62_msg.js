// Auto-generated. Do not edit!

// (in-package serial_imu.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Imu_data_package = require('./Imu_data_package.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class Imu_0x62_msg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.tag = null;
      this.gw_id = null;
      this.node_num = null;
      this.node_data = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('tag')) {
        this.tag = initObj.tag
      }
      else {
        this.tag = 0;
      }
      if (initObj.hasOwnProperty('gw_id')) {
        this.gw_id = initObj.gw_id
      }
      else {
        this.gw_id = 0;
      }
      if (initObj.hasOwnProperty('node_num')) {
        this.node_num = initObj.node_num
      }
      else {
        this.node_num = 0;
      }
      if (initObj.hasOwnProperty('node_data')) {
        this.node_data = initObj.node_data
      }
      else {
        this.node_data = new Array(16).fill(new Imu_data_package());
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Imu_0x62_msg
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [tag]
    bufferOffset = _serializer.uint8(obj.tag, buffer, bufferOffset);
    // Serialize message field [gw_id]
    bufferOffset = _serializer.uint8(obj.gw_id, buffer, bufferOffset);
    // Serialize message field [node_num]
    bufferOffset = _serializer.uint8(obj.node_num, buffer, bufferOffset);
    // Check that the constant length array field [node_data] has the right length
    if (obj.node_data.length !== 16) {
      throw new Error('Unable to serialize array field node_data - length must be 16')
    }
    // Serialize message field [node_data]
    obj.node_data.forEach((val) => {
      bufferOffset = Imu_data_package.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Imu_0x62_msg
    let len;
    let data = new Imu_0x62_msg(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [tag]
    data.tag = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [gw_id]
    data.gw_id = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [node_num]
    data.node_num = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [node_data]
    len = 16;
    data.node_data = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.node_data[i] = Imu_data_package.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 1267;
  }

  static datatype() {
    // Returns string type for a message object
    return 'serial_imu/Imu_0x62_msg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '83afb4dd1d120fe370f84d0e12c2a103';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # 0x62  data_package
    Header header
    uint8 tag
    uint8 gw_id
    uint8 node_num
    Imu_data_package[16] node_data
    
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    ================================================================================
    MSG: serial_imu/Imu_data_package
    uint8 tag
    uint8 bitmap
    uint8 id
    float32 prs
    uint32 time
    uint32 frame_rate
    float32 acc_x
    float32 acc_y
    float32 acc_z
    float32 gyr_x
    float32 gyr_y
    float32 gyr_z
    float32 mag_x
    float32 mag_y
    float32 mag_z
    float32 eul_r
    float32 eul_p
    float32 eul_y
    float32 quat_w
    float32 quat_x
    float32 quat_y
    float32 quat_z
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Imu_0x62_msg(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.tag !== undefined) {
      resolved.tag = msg.tag;
    }
    else {
      resolved.tag = 0
    }

    if (msg.gw_id !== undefined) {
      resolved.gw_id = msg.gw_id;
    }
    else {
      resolved.gw_id = 0
    }

    if (msg.node_num !== undefined) {
      resolved.node_num = msg.node_num;
    }
    else {
      resolved.node_num = 0
    }

    if (msg.node_data !== undefined) {
      resolved.node_data = new Array(16)
      for (let i = 0; i < resolved.node_data.length; ++i) {
        if (msg.node_data.length > i) {
          resolved.node_data[i] = Imu_data_package.Resolve(msg.node_data[i]);
        }
        else {
          resolved.node_data[i] = new Imu_data_package();
        }
      }
    }
    else {
      resolved.node_data = new Array(16).fill(new Imu_data_package())
    }

    return resolved;
    }
};

module.exports = Imu_0x62_msg;
