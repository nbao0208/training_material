package com.train.trainingmaterial.shared.enums;

import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

@RequiredArgsConstructor
public enum Role {
  STUDENT(
      Set.of(
          Authority.STUDENT_GET_INFO,
          Authority.STUDENT_GET_RATING,
          Authority.STUDENT_CANCEL_LESSON,
          Authority.STUDENT_COMPLETE_LESSON,
          Authority.STUDENT_GET_LESSON,
          Authority.STUDENT_GET_LESSON_REPORT,
          Authority.STUDENT_GET_TEST,
          Authority.STUDENT_GET_TEST_REPORT,
          Authority.STUDENT_GET_TEST_RESULT,
          Authority.STUDENT_POST_RATING,
          Authority.STUDENT_SUBMIT_TEST,
          Authority.STUDENT_GET_COMMENT_TEMPLATE)),

  TEACHER(
      Set.of(
          Authority.STUDENT_GET_INFO,
          Authority.STUDENT_GET_COMMENT_TEMPLATE,
          Authority.STUDENT_GET_RATING,
          Authority.STUDENT_CANCEL_LESSON,
          Authority.STUDENT_COMPLETE_LESSON,
          Authority.STUDENT_GET_LESSON,
          Authority.STUDENT_GET_LESSON_REPORT,
          Authority.STUDENT_GET_TEST,
          Authority.STUDENT_GET_TEST_REPORT,
          Authority.STUDENT_GET_TEST_RESULT,
          Authority.STUDENT_POST_RATING,
          Authority.STUDENT_SUBMIT_TEST,
          Authority.TEACHER_DELETE_LESSON,
          Authority.TEACHER_POST_LESSON,
          Authority.TEACHER_POST_TEST,
          Authority.TEACHER_UPDATE_LESSON,
          Authority.TEACHER_UPDATE_TEST));

  private final Set<Authority> roleAuthority;

  public List<SimpleGrantedAuthority> getAuthority() {
    List<SimpleGrantedAuthority> authorities =
        roleAuthority.stream()
            .map(auth -> new SimpleGrantedAuthority(auth.getAuthority()))
            .collect(Collectors.toList());
    authorities.add(new SimpleGrantedAuthority("ROLE_" + this.name()));
    return authorities;
  }
}
