package com.skillscore.portal.repository;

import com.skillscore.portal.entity.Question;
import com.skillscore.portal.entity.Subtopic;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface QuestionRepository extends JpaRepository<Question, Long> {

    List<Question> findBySubtopic(Subtopic subtopic);
    @Query("SELECT COUNT(q) FROM Question q")
    long countQuestions();
    @Query("""
    		SELECT t.name, COUNT(q)
    		FROM Question q
    		JOIN q.subtopic s
    		JOIN s.topic t
    		GROUP BY t.name
    		""")
    		List<Object[]> countQuestionsByTopic();
    		



}
