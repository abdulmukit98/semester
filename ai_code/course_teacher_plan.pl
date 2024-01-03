% Facts about courses and teachers
teaches(cse351, israt_jahan).
teaches(cse354, golam_moazzem).
teaches(cse355, morium_akter).
teaches(cse357, jugol_krisna_das).
teaches(cse358, anup_majumder).
teaches(cse359, sornali_basak).
teaches(cse362, liton_jude_rozario).
teaches(cse401, rafsan_jani).
teaches(cse403, humayun_kabir).
teaches(cse404, mushfiq_anwar).

teaches(cybersecurity, israt_jahan).
teaches(data_science, golam_moazzem).
teaches(big_data_engineering, morium_akter).
teaches(data_science, jugol_krisna_das).
teaches(big_data_analysis, anup_majumder).
teaches(web_designing, sornali_basak).
teaches(software_development, liton_jude_rozario).
teaches(vfx_and_animation, rafsan_jani).
teaches(networking, humayun_kabir).
teaches(web_designing, israt_jahan).
teaches(math254, mary_smith).
teaches(physics301, robert_jones).

% Rules for searching by course code
find_teacher_by_course(Code, Teacher) :-
    teaches(Code, Teacher).

% Rules for searching by teacher
find_courses_by_teacher(Teacher, Courses) :-
    teaches(Course, Teacher),
    append([], [Course], Courses).

% Example queries:
% To find the teacher for course 'cse101':
% ?- find_teacher_by_course(cse351, israt_jahan).
%
% To find the courses taught by 'israt_jahan':
% ?- find_courses_by_teacher(israt_jahan, Courses).
