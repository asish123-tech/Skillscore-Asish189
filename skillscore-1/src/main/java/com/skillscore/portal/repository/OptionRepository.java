package com.skillscore.portal.repository;

import com.skillscore.portal.entity.Option;
import com.skillscore.portal.entity.Question;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import jakarta.transaction.Transactional;
import java.util.List;

public interface OptionRepository extends JpaRepository<Option, Long> {

    List<Option> findByQuestion(Question question);

    @Transactional
    @Modifying
    @Query("DELETE FROM Option o WHERE o.question.id = :questionId")
    void deleteByQuestionId(Long questionId);
}
