package mx.edu.utez.model.role;

public class BeanRole {
    private short id;
    private String description;

    public BeanRole() {
    }

    public BeanRole(short id, String description) {
        this.id = id;
        this.description = description;
    }

    public short getId() {
        return id;
    }

    public void setId(short id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
