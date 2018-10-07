package top.dlpuzcl.pojo;

public class LabRatio {
    private String Label ;
    private double value;

    public String getLabel() {
        return Label;
    }

    public void setLabel(String label) {
        Label = label;
    }

    public double getValue() {
        return value;
    }

    public void setValue(double value) {
        this.value = value;
    }

    @Override
    public String toString() {
        return "LabRatio{" +
                "Label='" + Label + '\'' +
                ", value=" + value +
                '}';
    }
}
