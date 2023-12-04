package web.model;

import java.util.Objects;

public class Point {
    private final int x;
    private final double y;
    private final int r;

    private final boolean isInArea;

    public Point(int x, double y, int r) {
        this.x = x;
        this.y = y;
        this.r = r;
        this.isInArea = isInside(x, y, r);
    }

    private boolean isInside(double x, double y, double r) {
        // Треугольник в 1 четверти
        if (x >= 0 && y >= 0) {
            return (x <= r) && (y <= r / 2 - x / 2) && (y <= r / 2);
        }
        // Прямоугольник во 2 четверти
        if (x < 0 && y >= 0) {
            return (x >= -r / 2) && (y <= r);
        }
        // Сектор в 3 четверти
        if (x <= 0 && y <= 0) {
            return (x * x + y * y) <= (r * r);
        }
        // 4 четверть
        return false;
    }

    public double getX() {
        return x;
    }

    public double getY() {
        return y;
    }

    public int getR() {
        return r;
    }

    public boolean isInArea() {
        return isInArea;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Point point = (Point) o;
        return x == point.x && Double.compare(y, point.y) == 0 && r == point.r;
    }

    @Override
    public int hashCode() {
        return Objects.hash(x, y, r);
    }

    @Override
    public String toString() {
        return "Point{" +
                "x=" + x +
                ", y=" + y +
                ", r=" + r +
                ", isInArea=" + isInArea +
                '}';
    }
}
