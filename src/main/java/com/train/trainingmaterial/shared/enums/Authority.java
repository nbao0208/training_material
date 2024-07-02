package com.train.trainingmaterial.shared.enums;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Getter
public enum Authority {
  // <role:authority> is the format of the spring security framework

  TEACHER_POST_LESSON("teacher:post_lesson"),
  TEACHER_UPDATE_LESSON("teacher:update_lesson"),
  TEACHER_DELETE_LESSON("teacher:delete_lesson"),

  TEACHER_POST_TEST("teacher:post_test"),
  TEACHER_UPDATE_TEST("teacher:update_test"),

  STUDENT_GET_INFO("student:get_info"),
  STUDENT_GET_LESSON("student:get_lesson"),
  STUDENT_CANCEL_LESSON("student:cancel_lesson"),
  STUDENT_COMPLETE_LESSON("student:complete_lesson"),

  STUDENT_GET_TEST("student:get_test"),
  STUDENT_SUBMIT_TEST("student:submit_test"),

  STUDENT_GET_TEST_RESULT("student:get_test_result"),
  STUDENT_GET_TEST_REPORT("student:get_test_report"),
  STUDENT_GET_LESSON_REPORT("student:get_lesson_report"),
  STUDENT_POST_RATING("student:post_rating"),
  STUDENT_GET_RATING("student:get_rating"),
  STUDENT_GET_COMMENT_TEMPLATE("student:get_comment_template");

  private final String authority;
}
