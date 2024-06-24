all: run

clean:
	rm -rf out

out:
	mkdir -p out

out/PerfectNumberChecker.jar: out/parcs.jar src/main/java/org/example/PerfectNumberChecker.java src/main/java/org/example/PerfectNumberCounter.java
	@javac -cp out/parcs.jar --release 17 -d out src/main/java/org/example/PerfectNumberChecker.java src/main/java/org/example/PerfectNumberCounter.java
	@jar cf out/PerfectNumberChecker.jar -C out org/example/PerfectNumberChecker.class -C out org/example/PerfectNumberCounter.class
	@rm -f out/org/example/PerfectNumberChecker.class out/org/example/PerfectNumberCounter.class

out/ParcsJob.jar: out/parcs.jar src/main/java/org/example/ParcsJob.java
	@javac -cp out/parcs.jar --release 17 -d out src/main/java/org/example/ParcsJob.java
	@jar cf out/ParcsJob.jar -C out org/example/ParcsJob.class
	@rm -f out/org/example/ParcsJob.class

build: out out/PerfectNumberChecker.jar out/ParcsJob.jar

run: out/ParcsJob.jar out/PerfectNumberChecker.jar
	@cd out && java -cp 'parcs.jar:ParcsJob.jar:PerfectNumberChecker.jar' org.example.Main

out/parcs.jar:
	cp src/libs/parcs.jar out/parcs.jar
