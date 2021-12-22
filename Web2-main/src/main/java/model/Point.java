package model;

public class Point {
    private final double x;
    private final double y;
    private final double r;
    private boolean result;

    public Point(double x, double y, double r) {
        this.x = x;
        this.y = y;
        this.r = r;
    }

    public void setResult(boolean result) {
        this.result = result;
    }

    public double getX() {
        return x;
    }

    public double getY() {
        return y;
    }

    public double getR() {
        return r;
    }

    public boolean getResult() {
        return result;
    }

    public String getString(double d) {
        String s = String.valueOf(d);
        if (s.startsWith("-")) {
            if (s.length() <= 6)
                return s;
            else
                return s.substring(0, 6);
        }
        else {
            if (s.length() <= 5)
                return s;
            else
                return s.substring(0, 5);
        }
    }
}