package com.skillscore.portal.model;

public class ReviewModel {

    private String questionText;
    private Long selectedOption;          // User selected optionId
    private String selectedOptionText;    // Text of selected option
    private String correctOptionText;     // Text of correct option
    private boolean isCorrect;

    // -------- GETTERS & SETTERS ----------

    public String getQuestionText() {
        return questionText;
    }

    public void setQuestionText(String questionText) {
        this.questionText = questionText;
    }

    public Long getSelectedOption() {
        return selectedOption;
    }

    public void setSelectedOption(Long selectedOption) {
        this.selectedOption = selectedOption;
    }

    public String getSelectedOptionText() {
        return selectedOptionText;
    }

    public void setSelectedOptionText(String selectedOptionText) {
        this.selectedOptionText = selectedOptionText;
    }

    public String getCorrectOptionText() {
        return correctOptionText;
    }

    public void setCorrectOptionText(String correctOptionText) {
        this.correctOptionText = correctOptionText;
    }

    public boolean isCorrect() {
        return isCorrect;
    }

    public void setCorrect(boolean isCorrect) {
        this.isCorrect = isCorrect;
    }
}
