package OCP.vo;

public class announce {
    private int id;
    private String announce_title;
    private String announce_content;
    private String announce_date;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAnnounce_title() {
        return announce_title;
    }

    public void setAnnounce_title(String announce_title) {
        this.announce_title = announce_title;
    }

    public String getAnnounce_content() {
        return announce_content;
    }

    public void setAnnounce_content(String announce_content) {
        this.announce_content = announce_content;
    }

    public String getAnnounce_date() {
        return announce_date;
    }

    public void setAnnounce_date(String announce_date) {
        this.announce_date = announce_date;
    }
}
