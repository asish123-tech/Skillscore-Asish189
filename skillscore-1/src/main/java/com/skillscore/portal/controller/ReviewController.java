package com.skillscore.portal.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skillscore.portal.entity.Option;
import com.skillscore.portal.entity.Question;
import com.skillscore.portal.model.ReviewModel;
import com.skillscore.portal.repository.QuestionRepository;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/user/quantitative")
public class ReviewController {

    @Autowired
    private QuestionRepository questionRepository;

    @PostMapping("/submit")
    public String submitTest(HttpSession session, Model model) {

        @SuppressWarnings("unchecked")
        Map<Long, Long> savedAnswers =
                (Map<Long, Long>) session.getAttribute("answers");

        if (savedAnswers == null || savedAnswers.isEmpty()) {
            return "redirect:/user/quantitative";
        }

        List<ReviewModel> reviewList = new ArrayList<>();
        int score = 0;

        for (Map.Entry<Long, Long> entry : savedAnswers.entrySet()) {

            Long questionId = entry.getKey();
            Long selectedOptionId = entry.getValue();

            Question question = questionRepository.findById(questionId).orElse(null);
            if (question == null) continue;

            ReviewModel rm = new ReviewModel();
            rm.setQuestionText(question.getQuestionText());

            String correctText = "";
            String selectedText = "";
            boolean isCorrect = false;

            for (Option opt : question.getOptions()) {

                if (opt.isCorrect()) {
                    correctText = opt.getOptionText();
                }

                if (opt.getId().equals(selectedOptionId)) {
                    selectedText = opt.getOptionText();
                    if (opt.isCorrect()) {
                        isCorrect = true;
                        score++;
                    }
                }
            }

            rm.setSelectedOptionText(selectedText);
            rm.setCorrectOptionText(correctText);
            rm.setCorrect(isCorrect);

            reviewList.add(rm);
        }

        int totalQuestions = reviewList.size();
        int accuracy = (score * 100) / totalQuestions;

        String badge, badgeIcon;
        if (accuracy >= 80) {
            badge = "Gold Performer";
            badgeIcon = "🏆";
        } else if (accuracy >= 50) {
            badge = "Silver Achiever";
            badgeIcon = "🥈";
        } else {
            badge = "Keep Practicing";
            badgeIcon = "🔥";
        }

        model.addAttribute("reviewList", reviewList);
        model.addAttribute("score", score);
        model.addAttribute("totalQuestions", totalQuestions);
        model.addAttribute("accuracy", accuracy);
        model.addAttribute("badge", badge);
        model.addAttribute("badgeIcon", badgeIcon);

        session.removeAttribute("answers");

        return "user/review"; // ✅ CORRECT
    }
}
