package com.skillscore.portal.repository;

import com.skillscore.portal.entity.TestAttempt;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface TestAttemptRepository extends JpaRepository<TestAttempt, Long> {

    @Query("SELECT COUNT(t) FROM TestAttempt t")
    long countTests();

    @Query("SELECT AVG(t.scorePercentage) FROM TestAttempt t WHERE t.scorePercentage IS NOT NULL")
    Double averageScore();
}
