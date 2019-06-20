package OCP.vo;

public class board {
    private int id;
    private String board_account;
    private String board_content;
    private String board_date;
    private String board_image;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBoard_account() {
        return board_account;
    }

    public void setBoard_account(String board_account) {
        this.board_account = board_account;
    }

    public String getBoard_content() {
        return board_content;
    }

    public void setBoard_content(String board_content) {
        this.board_content = board_content;
    }

    public String getBoard_date() {
        return board_date;
    }

    public void setBoard_date(String board_date) {
        this.board_date = board_date;
    }

    public String getBoard_image() {
        return board_image;
    }

    public void setBoard_image(String board_image) {
        this.board_image = board_image;
    }

}
