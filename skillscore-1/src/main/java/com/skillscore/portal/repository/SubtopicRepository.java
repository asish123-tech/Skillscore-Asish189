package com.skillscore.portal.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import com.skillscore.portal.entity.Subtopic;

public interface SubtopicRepository extends JpaRepository<Subtopic, Long> {

	List<Subtopic> findByTopic_Id(Long topicId);

}
