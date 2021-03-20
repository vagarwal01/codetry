import 'models/coursemodel.dart';
import 'models/stylemodel.dart';


final _standStyle = Style(
  imageUrl: 'assets/mountain.png',
  name: 'Beginner',
  time: 30,
);
     
final _sittingStyle = Style(
  imageUrl: 'assets/mountain.png',
  name: 'Intermediate',
  time: 40,
);
final _legCrossStyle = Style(
  imageUrl: 'assets/mountain.png',
  name: 'Advanced',
  time: 50,
      

);

final styles = [_standStyle,_sittingStyle,_legCrossStyle];

final _course1 = Course(
    imageUrl: 'assets/yogaposes/018-seat.png',
    name: 'Diabetes',
    time: 20,
    students: 'Special Case'
);

final _course2 = Course(
    imageUrl: 'assets/yogaposes/011-arm_balance.png',
    name: 'Hands Stretching',
    time: 30,
    students: 'Body Workout'
);

final _course3 = Course(
    imageUrl: 'assets/yogaposes/021-half_moon_pose.png',
    name: 'Belly Exercises',
    time: 30,
    students: 'Body Workout'
);

final _course4 = Course(
    imageUrl: 'assets/yogaposes/018-boat_pose.png',
    name: 'Yoga For Abs',
    time: 30,
    students: 'Body Workout'
);

final _course5 = Course(
    imageUrl: 'assets/yogaposes/040-one_legged_pigeon_pose.png',
    name: 'Hips Yoga',
    time: 30,
    students: 'Body Workout'
);

final _course6 = Course(
    imageUrl: 'assets/yogaposes/028-bow.png',
    name: 'Arms Exercises',
    time: 30,
    students: 'Body Workout'
);    

final List<Course> courses = [_course1,_course2,_course3,_course4,_course5,_course6];