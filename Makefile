all: run

clean:
	rm -rf target/*.jar

target/PerfectNumberCounter.jar: src/main/java/org/example/PerfectNumberChecker.java src/main/java/org/example/PerfectNumberCounter.java
	@javac -cp src/libs/parcs.jar -d target src/main/java/org/example/PerfectNumberChecker.java src/main/java/org/example/PerfectNumberCounter.java
	@jar cf target/PerfectNumberCounter.jar -C target org/example/PerfectNumberChecker.class -C target org/example/PerfectNumberCounter.class
	@rm -f target/org/example/PerfectNumberChecker.class target/org/example/PerfectNumberCounter.class

target/ParcsJob.jar: src/main/java/org/example/Main.java src/main/java/org/example/PerfectNumberChecker.java src/main/java/org/example/PerfectNumberCounter.java
	@javac -cp src/libs/parcs.jar -d target src/main/java/org/example/Main.java src/main/java/org/example/PerfectNumberChecker.java src/main/java/org/example/PerfectNumberCounter.java
	@jar cf target/ParcsJob.jar -C target org/example/Main.class -C target org/example/PerfectNumberChecker.class -C target org/example/PerfectNumberCounter.class
	@rm -f target/org/example/Main.class target/org/example/PerfectNumberChecker.class target/org/example/PerfectNumberCounter.class

build: target/PerfectNumberCounter.jar target/ParcsJob.jar

run: build
	@cd target && java -cp 'parcs.jar:ParcsJob.jar' org.example.Main
