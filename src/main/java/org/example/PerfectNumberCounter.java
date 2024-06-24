package org.example;

import parcs.*;

import java.util.stream.LongStream;

public class PerfectNumberCounter implements AM {

    public void run(AMInfo info) {
        System.out.println("Worker started");

        long start = info.parent.readLong();
        System.out.println("range start = " + start);
        long end = info.parent.readLong();
        System.out.println("range end = " + end);

        PerfectNumberChecker perfectNumberChecker = new PerfectNumberChecker();

        System.out.println("counting Perfect numbers in range [" + start + ", " + end + "]");
        long count = LongStream.rangeClosed(start, end)
                .filter(perfectNumberChecker::isPerfect)
                .count();
        System.out.println("writing count to parent");
        info.parent.write(count);
        System.out.println("Worker finished");
    }
}
