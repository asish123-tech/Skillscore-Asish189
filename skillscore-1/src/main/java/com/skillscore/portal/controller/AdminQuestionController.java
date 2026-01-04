package com.skillscore.portal.controller;

import com.skillscore.portal.entity.Option;
import com.skillscore.portal.entity.Question;
import com.skillscore.portal.entity.Subtopic;
import com.skillscore.portal.repository.OptionRepository;
import com.skillscore.portal.repository.QuestionRepository;
import com.skillscore.portal.repository.SubtopicRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/admin/questions")
public class AdminQuestionController {

    private final QuestionRepository questionRepository;
    private final OptionRepository optionRepository;
    private final SubtopicRepository subtopicRepository;

    public AdminQuestionController(
            QuestionRepository questionRepository,
            OptionRepository optionRepository,
            SubtopicRepository subtopicRepository
    ) {
        this.questionRepository = questionRepository;
        this.optionRepository = optionRepository;
        this.subtopicRepository = subtopicRepository;
    }

    // ================= VIEW QUESTIONS =================
    @GetMapping
    public String questions(
            @RequestParam Long subtopicId,
            Model model
    ) {
    	Subtopic subtopic = subtopicRepository.findById(subtopicId)
    	        .orElseThrow(() -> new RuntimeException("Subtopic not found"));

    	List<Question> questions = questionRepository.findBySubtopic(subtopic);

        model.addAttribute("subtopic", subtopic);
        model.addAttribute("questions", questions);
        return "admin/questions";
    }

    // ================= ADD QUESTION =================
    @PostMapping("/add")
    public String addQuestion(
            @RequestParam Long subtopicId,
            @RequestParam String questionText,
            @RequestParam List<String> optionText,
            @RequestParam int correctIndex
    ) {
        Subtopic subtopic = subtopicRepository.findById(subtopicId).orElseThrow();

        Question question = new Question();
        question.setQuestionText(questionText);
        question.setSubtopic(subtopic);
        questionRepository.save(question);

        for (int i = 0; i < optionText.size(); i++) {
            Option option = new Option();
            option.setOptionText(optionText.get(i));
            option.setCorrect(i == correctIndex);
            option.setQuestion(question);
            optionRepository.save(option);
        }

        return "redirect:/admin/questions?subtopicId=" + subtopicId;
    }


    // ================= UPDATE QUESTION =================

    @PostMapping("/update")
    public String updateQuestion(
            @RequestParam Long questionId,
            @RequestParam Long subtopicId,
            @RequestParam String questionText,
            @RequestParam List<Long> optionIds,
            @RequestParam List<String> optionTexts,
            @RequestParam int correctOption
    )
 {
        Question question = questionRepository.findById(questionId).orElseThrow();
        question.setQuestionText(questionText);
        questionRepository.save(question);

        List<Option> options = optionRepository.findByQuestion(question);

        for (int i = 0; i < options.size(); i++) {
            Option opt = options.get(i);
            opt.setOptionText(optionTexts.get(i));
            opt.setCorrect(i == correctOption);
            optionRepository.save(opt);
        }

        return "redirect:/admin/questions?subtopicId=" + subtopicId;
    }

    // ================= DELETE QUESTION =================
    @PostMapping("/delete")
    public String deleteQuestion(
            @RequestParam Long questionId,
            @RequestParam Long subtopicId
    ) {
        optionRepository.deleteByQuestionId(questionId);
        questionRepository.deleteById(questionId);

        return "redirect:/admin/questions?subtopicId=" + subtopicId;
    }
}
