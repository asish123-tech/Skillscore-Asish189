package com.skillscore.portal.repository;

import com.skillscore.portal.entity.StudentAnswer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface StudentAnswerRepository extends JpaRepository<StudentAnswer, Long> {

    @Query("""
    SELECT t.name, AVG(
        CASE WHEN sa.isCorrect = true THEN 1 ELSE 0 END
    ) * 100
    FROM StudentAnswer sa
    JOIN sa.question q
    JOIN q.subtopic s
    JOIN s.topic t
    GROUP BY t.name
    """)
    List<Object[]> averageScoreByTopic();
}
