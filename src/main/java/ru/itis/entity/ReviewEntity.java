package ru.itis.entity;

public class ReviewEntity {
    private Long id;
    private Long userId;
    private String username;
    private Long courseId;
    private String courseTitle;
    private String text;

    public ReviewEntity() {}

    public ReviewEntity(Long id, Long userId, String username, Long courseId, String courseTitle, String text) {
        this.id = id;
        this.userId = userId;
        this.username = username;
        this.courseId = courseId;
        this.courseTitle = courseTitle;
        this.text = text;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Long getCourseId() {
        return courseId;
    }

    public void setCourseId(Long courseId) {
        this.courseId = courseId;
    }

    public String getCourseTitle() {
        return courseTitle;
    }

    public void setCourseTitle(String courseTitle) {
        this.courseTitle = courseTitle;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }
}