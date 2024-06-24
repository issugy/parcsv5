package org.example;

public class PerfectNumberChecker {

    public boolean isPerfect(long num) {
        if (num <= 1) {
            return false;
        }
        long sum = 1;
        for (long i = 2; i <= Math.sqrt(num); i++) {
            if (num % i == 0) {
                sum += i;
                if (i != num / i) {
                    sum += num / i;
                }
            }
        }
        return sum == num;
    }
}
