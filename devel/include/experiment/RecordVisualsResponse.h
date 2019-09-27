// Generated by gencpp from file experiment/RecordVisualsResponse.msg
// DO NOT EDIT!


#ifndef EXPERIMENT_MESSAGE_RECORDVISUALSRESPONSE_H
#define EXPERIMENT_MESSAGE_RECORDVISUALSRESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace experiment
{
template <class ContainerAllocator>
struct RecordVisualsResponse_
{
  typedef RecordVisualsResponse_<ContainerAllocator> Type;

  RecordVisualsResponse_()
    : status()  {
    }
  RecordVisualsResponse_(const ContainerAllocator& _alloc)
    : status(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _status_type;
  _status_type status;





  typedef boost::shared_ptr< ::experiment::RecordVisualsResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::experiment::RecordVisualsResponse_<ContainerAllocator> const> ConstPtr;

}; // struct RecordVisualsResponse_

typedef ::experiment::RecordVisualsResponse_<std::allocator<void> > RecordVisualsResponse;

typedef boost::shared_ptr< ::experiment::RecordVisualsResponse > RecordVisualsResponsePtr;
typedef boost::shared_ptr< ::experiment::RecordVisualsResponse const> RecordVisualsResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::experiment::RecordVisualsResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::experiment::RecordVisualsResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace experiment

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::experiment::RecordVisualsResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::experiment::RecordVisualsResponse_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::experiment::RecordVisualsResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::experiment::RecordVisualsResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::experiment::RecordVisualsResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::experiment::RecordVisualsResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::experiment::RecordVisualsResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "4fe5af303955c287688e7347e9b00278";
  }

  static const char* value(const ::experiment::RecordVisualsResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x4fe5af303955c287ULL;
  static const uint64_t static_value2 = 0x688e7347e9b00278ULL;
};

template<class ContainerAllocator>
struct DataType< ::experiment::RecordVisualsResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "experiment/RecordVisualsResponse";
  }

  static const char* value(const ::experiment::RecordVisualsResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::experiment::RecordVisualsResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string status\n\
";
  }

  static const char* value(const ::experiment::RecordVisualsResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::experiment::RecordVisualsResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.status);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct RecordVisualsResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::experiment::RecordVisualsResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::experiment::RecordVisualsResponse_<ContainerAllocator>& v)
  {
    s << indent << "status: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.status);
  }
};

} // namespace message_operations
} // namespace ros

#endif // EXPERIMENT_MESSAGE_RECORDVISUALSRESPONSE_H