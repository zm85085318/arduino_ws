// Generated by gencpp from file dockingrobot/Command.msg
// DO NOT EDIT!


#ifndef DOCKINGROBOT_MESSAGE_COMMAND_H
#define DOCKINGROBOT_MESSAGE_COMMAND_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace dockingrobot
{
template <class ContainerAllocator>
struct Command_
{
  typedef Command_<ContainerAllocator> Type;

  Command_()
    : command()  {
    }
  Command_(const ContainerAllocator& _alloc)
    : command(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _command_type;
  _command_type command;





  typedef boost::shared_ptr< ::dockingrobot::Command_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::dockingrobot::Command_<ContainerAllocator> const> ConstPtr;

}; // struct Command_

typedef ::dockingrobot::Command_<std::allocator<void> > Command;

typedef boost::shared_ptr< ::dockingrobot::Command > CommandPtr;
typedef boost::shared_ptr< ::dockingrobot::Command const> CommandConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::dockingrobot::Command_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::dockingrobot::Command_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::dockingrobot::Command_<ContainerAllocator1> & lhs, const ::dockingrobot::Command_<ContainerAllocator2> & rhs)
{
  return lhs.command == rhs.command;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::dockingrobot::Command_<ContainerAllocator1> & lhs, const ::dockingrobot::Command_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace dockingrobot

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::dockingrobot::Command_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::dockingrobot::Command_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::dockingrobot::Command_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::dockingrobot::Command_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::dockingrobot::Command_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::dockingrobot::Command_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::dockingrobot::Command_<ContainerAllocator> >
{
  static const char* value()
  {
    return "cba5e21e920a3a2b7b375cb65b64cdea";
  }

  static const char* value(const ::dockingrobot::Command_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xcba5e21e920a3a2bULL;
  static const uint64_t static_value2 = 0x7b375cb65b64cdeaULL;
};

template<class ContainerAllocator>
struct DataType< ::dockingrobot::Command_<ContainerAllocator> >
{
  static const char* value()
  {
    return "dockingrobot/Command";
  }

  static const char* value(const ::dockingrobot::Command_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::dockingrobot::Command_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string command\n"
;
  }

  static const char* value(const ::dockingrobot::Command_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::dockingrobot::Command_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.command);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Command_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::dockingrobot::Command_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::dockingrobot::Command_<ContainerAllocator>& v)
  {
    s << indent << "command: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.command);
  }
};

} // namespace message_operations
} // namespace ros

#endif // DOCKINGROBOT_MESSAGE_COMMAND_H
