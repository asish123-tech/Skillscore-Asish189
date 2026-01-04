package com.skillscore.portal.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skillscore.portal.entity.Topic;

public interface TopicRepository extends JpaRepository<Topic, Long> {
}

